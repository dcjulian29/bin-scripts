#!/usr/bin/perl
use Socket;

sub help()
{
  print <<EOF;
  Usage: servicecheck.pl configfile [full]

  This script checks for the availability of services by trying to
  connect to their according ports.
  Servers, ports and portdescription are read from a config file.

  If optional parameter full is given even successful connections
  are displayed else only errors are shown.

  The Configuration file should look like this:
    <server imap.domain>
      143 = IMAP
       25 = SMTP
    </server>

    <server fs.domain>
      389 = LDAP
      139 = Samba
       80 = Apache
     2049/udp = NFS Server
    </server>

    <server printserver.domain>
       515 = LPD
    #   139 = Samba
      6566 = Sane
       631 = Cups 631
        80 = Cups 80
    </server>

    <server devel.domain>
      80 = Apache
    </server>

EOF
}

sub readConfig($)
{
  my $cfgfile = $_[0];
  open (FILE,$cfgfile) || die("could not open configfile '$cfgfile'");
  my @file = <FILE>;
  close (FILE);

  my ($name, $value);
  my %config;
  my $section = '';
  my $sname = '';

  foreach my $line (@file)
  {
    $line =~ s/#.*$//;
    $line =~ s/^\s*//;
    $line =~ s/\s*$//;
    next if ($line eq '');
    if ($line =~ m/<\/\Q$section\E>/i)
    {
      $section = '';
      $sname = '';
      next;
    }

    if ($line =~ m/<(\w*)\s?(.*)>/i)
    {
      $section = $1;
      $sname = $2;
      $sname = trim($sname);
      if ($sname eq '')
      {
        $config{lc($section)} = []; #prepare anonymous arrayref
      }
      else
      {
        ${$config{lc($section)}}{$sname} = [];
      }
      next;
    }

    if ($section && $sname eq '')
    {
      push(@{$config{lc($section)}}, $line);
    }
    else
    {
      if($section && $sname ne '')
      {
        push(@{${$config{lc($section)}}{$sname}}, $line);
      }
      else
      {
        ($name, $val) = split("=", $line);
        $val =~ s/^\s*//;
        $name =~ s/\s*$//;
        $config{lc($name)} = $val;
      }
    }
  }

  return %config;
}

sub trim($)
{
  my $string = $_[0];
  $string =~s/^\s//g;
  $string =~s/\s$//g;

  return $string;
}

################################################################################

if (scalar(@ARGV) < 1)
{
  help();
  exit;
}

my %CFG = readConfig($ARGV[0]);
my $FULL = 0;
   $FULL = 1 if ($ARGV[1] eq 'full');

my ($server, $services);
my ($service, $port, $name, $prot);
my ($iaddr, $dnsfail, $paddr, $connfail);

foreach $server (sort(keys(%{$CFG{server}})))
{
  $services = ${$CFG{server}}{$server};
  # resolve servernames
  $dnsfail = 0;
  $iaddr   = inet_aton($server) || ($dnsfail = 1);
  if ($dnsfail)
  {
    printf ("ERROR   %15s - Could not resolve DNS Name\n", $server);
    next;
  }

  # check ports
  foreach $service (@{$services})
  {
    ($port, $name) = split('=', $service);
    $name     = trim($name);
    $port     =~ s/\/(.*)$//;
    $prot     = trim($1);
    $port     = trim($port);
    $prot     = 'tcp' unless ($prot =~ m/^udp$/i);
    $connfail = 0;
    $paddr    = sockaddr_in($port, $iaddr);
    if ($prot eq 'tcp')
    {
      socket(SOCK, PF_INET, SOCK_STREAM, getprotobyname($prot));
    }
    else
    {
      socket(SOCK, PF_INET, SOCK_DGRAM, getprotobyname($prot));
    }

    connect(SOCK, $paddr) || ($connfail = 1);
    close (SOCK);

    if($connfail)
    {
      printf ("ERROR   %15s - %s (%s/%s) connection failed\n", $server, $name, $port, $prot);
    }
    else
    {
      if($FULL)
      {
        printf ("SUCCESS %15s - %s (%s/%s) connection succeded\n", $server, $name, $port, $prot);
      }
    }
  }
}
