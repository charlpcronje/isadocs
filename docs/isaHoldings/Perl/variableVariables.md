# Variable Variables

```perl
use strict;
use warnings;
use 5.10.0;

our $x = '5';
my $field_name = 'x';

my $contents;
{ # no strict is lexially scoped
    no strict 'refs';
    $contents = ${$field_name};
}
```