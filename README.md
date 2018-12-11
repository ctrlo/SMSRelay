# SMSRelay - relay for Andrews & Arnold's SMS service

This is a quick and dirty script to relay SMS messages from a single
destination to multiple destinations.

It is primarily designed for routing inbound messages to a number within an
Andrews & Arnold's account to multiple SIMs.

## Installation

* Install files to ```/usr/local/SMSRelay```
* Copy ```config.yml.example``` to ```config.yml``` and update as required
* Copy ```smsrelay.service``` to ```/etc/systemd/system/smsrelay.service```
* ```systemctl enable smsrelay.service```
* ```systemctl start smsrelay.service```

