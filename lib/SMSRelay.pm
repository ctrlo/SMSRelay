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

    foreach my $dest (@{$conf->{relay_to}})
    {
        $form{da} = $dest;
        my $response = $ua->post($url, \%form);
        debug $response->as_string;
    }
};

true;
