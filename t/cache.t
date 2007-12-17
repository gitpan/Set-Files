#!/usr/bin/perl

use Set::Files;

chdir "t"  if (-d "t");

$ntest = 13;
$itest = 1;

print "Set::Files (Cache)...\n";
print "1..$ntest\n";

sub test {
  my($a,$b)=@_;
  if ($a eq $b) {
    print "ok $itest\n";
  } else {
    print "Expected: $a\n";
    print "Got     : $b\n";
    print "not ok $itest\n";
  }
  $itest++;
}

$q = new Set::Files("path"          => ["dir1a","dir1b"],
                    "types"         => ["type1","type2"],
                    "default_types" => "none"
                   );
$q->cache;
$q = new Set::Files("path"          => ["dir1a","dir1b"],
                    "types"         => ["type1","type2"],
                    "default_types" => "none",
                    "read"          => "cache"
                   );

test("a b c",           join(" ",$q->list_sets));
test("a b",             join(" ",$q->list_sets("type1")));
test("a ab abc ac b",   join(" ",$q->members("a")));
test("ab abc b bc",     join(" ",$q->members("b")));
test("1",               $q->is_member("a","ab"));
test("0",               $q->is_member("a","c"));
test("type1 type2",     join(" ",$q->list_types));
test("type1 type2",     join(" ",$q->list_types("a")));
test("type1",           join(" ",$q->list_types("b")));
test("dir1a",           join(" ",$q->dir("a")));
test("dir1b",           join(" ",$q->dir("c")));
test("1",               join(" ",$q->opts("a","a1")));
test("vala2",           join(" ",$q->opts("a","a2")));

unlink "dir1a/.set_files.cache";

# Local Variables:
# mode: cperl
# indent-tabs-mode: nil
# cperl-indent-level: 3
# cperl-continued-statement-offset: 2
# cperl-continued-brace-offset: 0
# cperl-brace-offset: 0
# cperl-brace-imaginary-offset: 0
# cperl-label-offset: -2
# End:

