my $data1 = open "File1.txt";
my $data2 = open "File2.txt";

my @names1 = $data1.lines;
my @names2 = $data2.lines;

@names1.split('');
my @names = ();
my @names3 = ();

for @names1 -> $line {
    my @name = $line.split(' ');
    @names.push(@name[0]);
    @names.push(@name[1]);
}

for @names2 -> $line {
    my @name = $line.split(' ');
    @names3.push(@name[0]);
    @names3.push(@name[1]);
}

my %hash1 = @names;
my %hash2 = @names3;
my %hash3 = ();

my @list = ();

for %hash1 -> $v1 
{
	if %hash2{$v1.keys}:exists eq True
	{
		@list := ($v1.values, %hash2{$v1.keys}.values);
		%hash3.push: ($v1.keys => @list);
	}
	else
	{
		@list := ($v1.values, '- ');
		%hash3.push: ($v1.keys => @list);
	}	
}
for %hash2 -> $v2 
{
	if %hash1{$v2.keys}:!exists eq True
	{
		@list := ('- ', $v2.values);
		%hash3.push: ($v2.keys => @list);
	}	
}
my $fh = open "newdatafile2.txt", :a;
$fh.print("Name    Age  Phone\n");
$fh.print(%hash3);
$fh.close;


