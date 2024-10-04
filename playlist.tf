resource "spotify_playlist" "Mass_Telugu_Stuff" {
  name        = "Alamanda Bhaskar"
  description = "Purely alone chilling mode"
  public      = false

  tracks = [
    "68ie7XpZlLTB9HM9ri9YSG",
    "5z2QHBeHThZ4l8EtRQzQoJ",
    "4nQTjFHjgznhXpW2j3bu9Y",
    "1vnDu8pbmwz88G6RDugerQ",
    "2ae6PxICSOZHvjqiCcgon8",
  ]
}

resource "spotify_playlist" "slimShady" {
  name  = "Slim Shady"

  tracks = [ data.spotify_search_track.eminem.tracks[0].id,
    data.spotify_search_track.eminem.tracks[2].id,
    data.spotify_search_track.eminem.tracks[3].id,
    data.spotify_search_track.eminem.tracks[4].id,
    data.spotify_search_track.eminem.tracks[5].id,
    data.spotify_search_track.eminem.tracks[6].id,
    data.spotify_search_track.eminem.tracks[7].id,
    data.spotify_search_track.eminem.tracks[8].id,
    data.spotify_search_track.eminem.tracks[9].id,
    data.spotify_search_track.eminem.tracks[10].id
  ]
}

data "spotify_search_track" "eminem" {
  artist = "Eminem"
  limit = 20
}