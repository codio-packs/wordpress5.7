# WordPress (5.7)

## Using the Pack
To use the Pack, we created 2 menu options, which you can find on the right of the menu. These menus can be configured in the `.codio` file.

1. **Configure Project** : When you first come into your Project, select this to complete the configuration of your project.
1. **WordPress Login** : This previews your app. 

**Note:** Do not set the 'Inside Codio' option.

## Configure Wordpress
To configure your Wordpress project

1. Go to the Run menu.
1. Select `Configure Project`.

If you prefer to run the configuration script yourself, open the terminal (Tools>Terminal) and enter

    bash wpconfig.sh

When prompted for `password:` enter `codio`.

## Run the Wordpress Installer
You should now run the Wordpress Installer to complete the setup.

1. Go to the Preview menu.
1. Select `WordPress Login`.
1. Run through the brief installation process.
1. Once it is completed, you will be asked to login.
1. Once logged in, select the Plugins option in the left menu and enable, then activate the plugin called `permalink-fix-disable-canonical-redirects`, which is necessary for Wordpress to work correctly on Codio.


## All done!
From the menu bar select 'Codio Site' (unless you used a different Site Title in the WordPress installer) and you now have Wordpress fully up and running.


 