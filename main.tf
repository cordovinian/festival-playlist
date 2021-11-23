terraform {
  required_version = "~>0.15.0"

  required_providers {
    spotify = {
      version = "~> 0.2.5"
      source  = "conradludgate/spotify"
    }
  }
}

provider "spotify" {
  api_key = var.spotify_api_key
}

variable "spotify_api_key" {
  type = string
  description = "You secret API key."
}

output "search_results" {
  value = {
    dolly_parton = data.spotify_search_track.by_artist.tracks
  }
}

data "spotify_search_track" "by_artist" {
  artist = "Dolly Parton"
  #  album = "Jolene"
  #  name  = "Early Morning Breeze"
}