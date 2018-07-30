use Curses::UI;
use strict;
use warnings;
use diagnostics;


my $cui = Curses::UI->new(  -clear_on_exit => 1, -color_support => 1);

my @main = ({ -label => 'APPS',-submenu => [{ -label => 'Messages', -value => \&Messages},
                                            {-label => 'Games', -value => \&Games},
                                            { -label => 'Reseaux', -value => \&Reseaux},]},
            { -label => 'EXIT', -submenu => [{ -label => 'Quit', -value => \&Quit}]});
my $menu = $cui->add('MENU','Menubar', -menu => \@main,-fg  => "green",);



my $win = $cui->add(
  'win', 'Window',
  -border => 1,
  -y    => 1,
  -bfg  => 'red',
  );

sub Messages()
{
    my $return = $cui->dialog(
    -message   => "load Messages",
    -buttons   => ['yes', 'no'],);
}

sub Reseaux()
{
    my $return = $cui->dialog(
    -message   => "load Reseaux",
    -buttons   => ['yes', 'no'],);
}

sub Games()
{
  my $return = $cui->dialog(
  -message   => "load Games",
  -buttons   => ['yes', 'no']);
}

sub Quit()
{
    my $return = $cui->dialog(
    -message   => "do you want to exit ?",
    -title     => "Exit ?",
    -buttons   => ['yes', 'no'],
      );

    exit(0) if $return;
}

$cui->set_binding( \&Quit, "\cC");
$cui->set_binding(sub {$menu->focus()}, "\cX");

my $container = $win->add(
    'mycontainer', 'Container'
);

$container->add('shurg', 'Label', -text => '¯\_(ツ)_/¯', -x => 10, -y => 5);
#$container->delete('shurg');

$win->focus();
$cui->mainloop();
