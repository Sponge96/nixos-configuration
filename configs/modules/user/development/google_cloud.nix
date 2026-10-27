{ pkgs, ... }:

{
  home.packages = with pkgs; [ google-cloud-sdk ];
  home.sessionVariables = {
    GOOGLE_CLOUD_PROJECT = "random42-209114";
    GOOGLE_CLOUD_LOCATION = "global";
    GOOGLE_APPLICATION_CREDENTIALS =
      "/home/sponge/.config/gcloud/application_default_credentials.json";
  };
}
