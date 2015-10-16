##What is Flareboard?

Flareboard is the way to get your [CloudFlare](http://www.cloudflare.com) stats
to display in [StatusBoard](http://www.panic.com/statusboard) or
[The Dash](https://thedash.com). It has been designed to be very easy to install
and use. It requires no third-party gems, and can be run on any version of ruby
from 1.9.x to 2.2.x

Add your credentials and sites to flareboard, and it will hit the CloudFlare API
to grab your stats and convert them into the JSON that Statusboard uses for
graphing. You can drop the resulting file into a dropbox folder or host it on a
web server. Unless you are paying for a CloudFlare Pro account, your stats will
only update every 24 hours, so it's no use running flareboard more often than
that.

**Note**: It is no longer compatible with Ruby 1.8, as that version is no longer
being supported upstream. Please upgrade.

## Installation

### Via gem
Simply run ```gem install flareboard```

### Manual
Copy the file ```bin/flareboard``` onto your computer. Put it either in a bin
directory in your path or somewhere else.

## Configuration

There are three ways of configuring the script. Via the command-line arguments
documented in the Usage section, via a config file (*~/.flareboard.rc*), or
by editing the script directly. In order of priority (highest to lowest), it
will use command-line options, the config file, and then the hard-coded config
hash in the script.

It is *highly* recommended to use a config file, as passing your API token on
the command-line is a security risk, and modifying the script itself will make
upgrades manual and laborious.

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

## Usage

    Usage: flareboard [options]
        -f, --file FILE                  Where to write the JSON output
                                         Defaults to STDOUT
        -t, --token TOKEN                Your CloudFlare API token
        -e, --email EMAIL                Your CloudFlare email address
        -i, --interval INTERVAL          CloudFlare history interval
                                         Defaults to 40
            --title TITLE                Title of the status board
                                         Defaults to 'Cloudflare - Pageviews'

    If no file is given, flareboard will write to standard out.
