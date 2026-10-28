#!/usr/bin/perl -w
#
# tests/bash-scripts.t

use Test::More qw( no_plan );

my @script_list = (
    'usr/bin/cz-pdns-backup',
    'usr/bin/cz-pdns-update',
    'usr/bin/cz-zone-update',
    );
for my $sname (@script_list) {
    my $s = "../$sname";
    my $t1 = `$s help 2>&1`;
    if (!$t1) {
        print "ERROR: No output from $sname help command\n";
        fail('Help');
    } elsif (!ok ($t1 =~ /^\s*(Usage|SYNOPIS)/, "$sname Help")) {
        print "ERROR: unexpected output\n";
        print "$t1\n"
    }
}
