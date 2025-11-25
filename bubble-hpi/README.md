# Bubble HPI Template

This template is a modified version of the [bubble](https://typst.app/universe/package/bubble) template.

## Installation

For Linux and macOS, the supplied script can be used. Windows users need to figure it out themselves or switch to Linux, sorry :(

```sh
git clone --depth 1 https://github.com/hpi25/typst-templates
cd typst-templates/bubble-hpi
./install.sh
```

This will install the current version into the proper folder. To install the newest version, simply update the repo using `git pull` and execute the `install.sh` script again.

Installed versions will be kept.

## Usage

```typst
#import "@hpi/bubble-hpi:0.1.0": *

#show: bubble.with(
  title: "A HPI template", // required
  subtitle: "Lorem ipsum or something idk",
  authors: ("Nicht Holger Karl", "Max Mustermann"),
  affiliation: "Hasso Plattner Institut",
  date: datetime.today().display("[day] [month repr:long] [year]"),
  year: datetime.today().display("[year]"),
  class: "Class",
  other: ("Extra 1", "Extra 2"),
  title-size: 3em,
  subtitle-size: 2em,
  logo: image("logo.svg"),
)
```

Only the `title` attribute is required, but all other attributes can be optionally overwritten. For usage of the individual properties, refer to the above snippet.

