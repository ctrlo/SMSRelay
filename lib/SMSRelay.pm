package SMSRelay;

use strict; use warnings;

use Dancer2;
use LWP::UserAgent;

our $VERSION = '0.1';

get '/' => sub {
    return "This is the SMS relay";
};

post '/inbound' => sub {

    my $url  = 'https://sms.aa.net.uk/sms.cgi';
    my $ua   = LWP::UserAgent->new;
    my $conf = config->{smsrelay};

    my %form = (
        username => $conf->{submit_username},
        password => $conf->{submit_password},
        ud       => param('ud'),
        oa       => param('oa'),
    );


    if (my $kid = fork)
    {
        # will fire off a worker and then abandon it, thus making reaping
        # the long running process (the grndkid) init's (pid1) problem
        waitpid($kid, 0); # wait for child to start grandchild and clean up
    }
    else {
        if (my $grandkid = fork) {
            POSIX::_exit(0); # the child dies here
        }
        else {
            foreach my $dest (@{$conf->{relay_to}})
            {
                # Send the messages to each destination
                $form{da} = $dest;
                my $response = $ua->post($url, \%form);
                debug $response->as_string;
            }
        }
    }

    return 1;

};

true;
