##What is Flareboard?

Flareboard is the way to get your [CloudFlare](http://www.cloudflare.com) stats
to display in your [StatusBoard](http://www.panic.com/statusboard). It has been
designed to be very easy to install and use. It requires no third-party gems,
and can be run on any version of ruby from 1.8.7 to 2.1.1.

Add your credentials and sites to flareboard, and it will hit the CloudFlare API
to grab your stats and convert them into the JSON that Statusboard uses for
graphing. You can drop the resulting file into a dropbox folder or host it on a
web server. Unless you are paying for a CloudFlare Pro account, your stats will
only update every 24 hours, so it's no use running flareboard more often than
that.

**Note**: For compatibility with 1.8.7. you *will* have to install the JSON gem.
Also, you have my sympathies for having to use 1.8.7.

## Usage

    Usage: flareboard [options]
        -f, --file FILE                  Where to write the JSON output
        -t, --token TOKEN                Your CloudFlare API token
        -e, --email EMAIL                Your CloudFlare email address
        -i, --interval INTERVAL          CloudFlare history interval
            --title TITLE                Title of the status board.
                                         Defaults to 'Cloudflare - Pageviews'

    If no file is given, flareboard will write to standard out.

## Configuration

There are three ways of configuring the script. Via the command-line arguments
documented in the previous section, via a config file, or by editing the script
directly. In order of priority, it will use command-line options, then config
file, and then the hard-coded config hash in the script.

You can edit the config hash right in the script, or you can create a config
file in your home directory named **.flareboard.rc**. It is *highly* recommended to 
use a config file.

### :title
The title that will show up on your status board

### :token
Your Cloudflare token - available via their website at
https://www.cloudflare.com/my-account

### :email
The email you have registered with cloudflare. **NOT** your username!

### :interval
Interval Values - see https://www.cloudflare.com/docs/client-api.html for
latest.

    20-40 only update once a day - it is no use polling more often than that
    20 = Past 30 days
    30 = Past 7 days
    40 = Past day
    !!! Anything higher than this requires a paid CloudFlare account !!!
    !!! This also enables greater than daily updates !!!
    100 = 24 hours ago
    110 = 12 hours ago
    120 = 6 hours ago

### :sites
Sites have a site specific title, a URL, and a color for the graph.
Colors: yellow, green, red, purple, blue, mediumGray, pink, aqua, orange, lightGray

Here is an example config file, using the same data as the example hash. 

    ---
    :token: XXXXXXX
    :email: user@example.com
    :sites:
    - :title: 'Should I Use That In Prod'
      :url:   'shouldiusethatinprod.com'
      :color: 'red'
    - :title: "It's Not Rocket Science"
      :url:   'itsnotrocketscience.info'
      :color: 'purple'
