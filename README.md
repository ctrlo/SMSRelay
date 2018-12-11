# SMSRelay - relay for Andrews & Arnold's SMS service

This is a quick and dirty script to relay SMS messages from a single
destination to multiple destinations.

It is primarily designed for routing inbound messages to a number within an
Andrews & Arnold's account to multiple SIMs.

It is a Perl script requiring the Dancer2 web framework. Whilst this is
overkill for the required task (and probably makes it more difficult to
install), it was the quickest way for me to write it.

## Installation

* Install files to ```/usr/local/SMSRelay```
* Copy ```config.yml.example``` to ```config.yml``` and update as required
* Copy ```smsrelay.service``` to ```/etc/systemd/system/smsrelay.service```
* ```systemctl enable smsrelay.service```
* ```systemctl start smsrelay.service```
* In the control panel settings for the particular number, set the inbound SMS destination to be ```http://you.example.com:5000/inbound```

