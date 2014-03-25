package MT::Plugin::HideVersion;
use strict;
use warnings;
use base qw( MT::Plugin );

my $plugin = __PACKAGE__->new(
    {   name    => 'HideVersion',
        version => 0.01,
        description =>
            '<__trans phrase="Hide version numbers in admin screen.">',
        plugin_link => 'https://github.com/masiuchi/mt-plugin-hide-version',

        author_name => 'masiuchi',
        author_link => 'https://github.com/masiuchi',

        registry => { callbacks => { template_source => \&_hide_version, }, },
    }
);
MT->add_plugin($plugin);

sub _hide_version {
    my ( $cb, $app, $tmpl_ref ) = @_;
    $$tmpl_ref =~ s/\?v=<\$?mt:?var\s+name="mt_version_id"[^>]*>//gi;
}

1;
