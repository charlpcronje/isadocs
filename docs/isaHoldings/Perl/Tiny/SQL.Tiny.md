# SQL::Tiny

## DOCUMENTATION
A very simple SQL-building library. It's not for all your SQL needs, only the very simple ones.

It doesn't handle JOINs. It doesn't handle subselects. It's only for simple SQL.

In my test suites, I have a lot of ad hoc SQL queries, and it drives me nuts to have so much SQL code lying around. SQL::Tiny is for generating SQL code for simple cases.

I'd far rather have:

```perl
my ($sql,$binds) = sql_insert(
    'users',
    {
        name      => 'Dave',
        salary    => 50000,
        status    => 'Active',
        dateadded => \'SYSDATE()',
        qty       => \[ 'ROUND(?)', 14.5 ],
    }
);
than hand-coding:

my $sql   = 'INSERT INTO users (name,salary,status,dateadded,qty) VALUES (:name,:status,:salary,SYSDATE(),ROUND(:qty))';
my $binds = {
    ':name'      => 'Dave',
    ':salary'    => 50000,
    ':status'    => 'Active',
    ':dateadded' => \'SYSDATE()',
    ':qty'       => 14.5,
};
```

