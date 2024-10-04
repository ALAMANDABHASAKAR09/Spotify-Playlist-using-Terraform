Here's a well-structured README for your GitHub project using Terraform to manage Spotify playlists:

---

# Terraform Spotify Playlist Provider 🎶🌱

This project demonstrates how to manage your Spotify playlists using Terraform. With the Terraform Spotify Provider, you can automate the creation, modification, and management of playlists for various occasions such as morning vibes, evening chill, or party nights.

## 📚 Featured Resources
- **[Tutorial: Manage Spotify Playlists with Terraform](https://learn.hashicorp.com/tutorials/terraform/spotify-playlist)**
- **[Interview: Build Your Summer Spotify Playlist with Terraform](https://www.hashicorp.com/blog/build-your-summer-spotify-playlist-with-terraform)**

## 🔧 Prerequisites
Before you get started, make sure you have the following installed:
- **Terraform** (v0.12.x or higher)  
- **Docker** (Running and properly configured)
- **Spotify Developer Account** (For Client ID and Secret)
- **Spotify OAuth2 Tokens** (Required for API interaction)
- **VS Code** (Recommended for editing Terraform files)

> **Note:** I am not affiliated with HashiCorp or Terraform. Make sure to update to the latest version of the Spotify provider if you encounter issues.

## 🛠️ Installation

To get started, add the following provider configuration to your Terraform setup:

```hcl
terraform {
  required_providers {
    spotify = {
      source  = "conradludgate/spotify"
      version = "~> 0.2.0"
    }
  }
}
```

## 🚀 Usage

1. **OAuth2 Token Server Setup**
   To interact with Spotify’s API via Terraform, you need an OAuth2 token server. You have two options:
   
   - **Public Proxy**: Use the [OAuth2 Proxy](https://oauth2.conrad.cafe).
     - Register and create a Spotify token with the required scopes:
       - `user-read-email`
       - `user-read-private`
       - `playlist-read-private`
       - `playlist-modify-private`
       - `playlist-modify-public`
       - `user-library-read`
       - `user-library-modify`
     - Take note of the **token ID** in the URL and the **API key**.
   
   - **Self-Hosted OAuth2 Proxy**: For more control, you can self-host a Spotify OAuth2 proxy using the `spotify_auth_proxy`. Once you have the server running, store the **API key** for later use.

2. **Spotify Provider Configuration**
   
   In your Terraform project, configure the Spotify provider by specifying the `api_key`, `auth_server`, and other required details:

   ```hcl
   provider "spotify" {
     auth_server = "https://oauth2.conrad.cafe"
     api_key     = var.spotify_api_key
     username    = "your-username"
     token_id    = "your-token-id"
   }

   variable "spotify_api_key" {
     type = string
   }
   ```

3. **Define Playlists**
   
   Use Terraform to define and create playlists. Here’s an example configuration to create a playlist and add tracks:

   ```hcl
   resource "spotify_playlist" "playlist" {
     name        = "My Awesome Playlist"
     description = "This playlist is so awesome!"
     public      = false

     tracks = flatten([
       data.spotify_track.overkill.id,
       data.spotify_track.blackwater.id,
       data.spotify_search_track.search.tracks[*].id,
     ])
   }

   data "spotify_track" "overkill" {
     url = "https://open.spotify.com/track/4XdaaDFE881SlIaz31pTAG"
   }

   data "spotify_track" "blackwater" {
     spotify_id = "4lE6N1E0L8CssgKEUCgdbA"
   }

   data "spotify_search_track" "search" {
     name   = "Somebody Told Me"
     artist = "The Killers"
     album  = "Hot Fuss"
   }

   output "test" {
     value = data.spotify_search_track.search.tracks
   }
   ```

4. **Apply Your Configuration**

   Run the following commands to apply your configuration:
   
   ```bash
   terraform init
   terraform apply
   ```

## 🔑 Required Scopes

Make sure the Spotify OAuth token has the following scopes for the Terraform provider to interact with your playlists:

- `user-read-email`
- `user-read-private`
- `playlist-read-private`
- `playlist-modify-private`
- `playlist-modify-public`
- `user-library-read`
- `user-library-modify`

## 🐛 Troubleshooting

If you're having trouble with the provider, try updating to the latest version by modifying the `version` constraint in the `terraform` block. Ensure Docker is running correctly and the API keys are valid.

## 👥 Contribution

Feel free to contribute by submitting issues, suggestions, or pull requests.

---

Enjoy automating your Spotify playlists with Terraform! 🎵🌱
