open(my $fh, "<", "/etc/trueuserdomains");
while(<$fh>) {
	chomp $_;
        if ($_ =~ /(.*?): (.*)/) {
                $domain  = $1;
                $account = $2;

                $dir = "/home/$account/mail/$domain";
                if (-e $dir) {
                        opendir(DIR, $dir) or die $!;
                        while (my $file = readdir(DIR)) {
                                next if ($file =~ m/^\./);
                                print "$file\@$domain\n";
                        }
                        closedir(DIR);
                }
        }
}
close($fh);
