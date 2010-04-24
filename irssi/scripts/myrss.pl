#!/usr/bin/perl

use strict;
use warnings;

use IO::Socket;
use vars qw($VERSION %IRSSI);
use Irssi qw(command_bind signal_add);
$VERSION = '0.20';
%IRSSI = (
        authors         => 'T3slider',
        contact         => 't3slider@gmail.com',
        name            => 'Perl Wrapper',
        description     => 'Perl wrapper script to call system functions upon channel input',
        license         => 'GPL',
);

sub event_privmsg {
	my ($server, $data, $nick, $address) = @_;
	question($server, $data, $nick, $nick);
}

sub ownquestion {
	my ($server, $msg, $target) = @_;
	question($server, $msg, "", $target);
}

sub publicquestion {
	my ($server, $msg, $nick, $address, $target) = @_;
	question($server, $msg, $nick, $target);
}

sub question {
	my ($server, $msg, $nick, $target) = @_;
	$_ = $msg;
	if (/^\!rss$/i) {
		&callscript($server, $msg, $nick, $nick);
	}
	elsif (/^\!rss$/i) {
		&callscript($server, $msg, $nick, $nick);
	}
# To add additional hooks, add an elsif{} block (the prev. 3 lines). To
# send to PM the last argument should be $nick as above. To send to the
# originating channel change the last $nick to $target in the passed args.
	return 0;
}
sub callscript {
	my ($server, $msg, $nick, $target) = @_;
# Change the following line to whatever script you run. If you want to use
# this one script as a wrapper to multiple commands, just copy this
# entire subroutine (and name it something other than callscript) and
# call it from question() above.
	my $output = `/home/mredd/.irssi/scripts/ran-rss.sh`;
	my @outarray = split(/\n/, $output);
	foreach (@outarray) {
		$server->command('msg '.$target.' '.$_);
	}
}

signal_add("message public", "publicquestion");
signal_add("message own_public", "ownquestion");
signal_add("message private", "event_privmsg");
