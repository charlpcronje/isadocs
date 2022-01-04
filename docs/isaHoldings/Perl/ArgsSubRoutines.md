# Argument Parsing Sub-Routines

```perl
my %args  = @_ && ref $_[0] eq 'HASH' ? %{ $_[0] } : @_;
    bless { %args }, $class;
```
