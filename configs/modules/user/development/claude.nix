{ pkgs, ... }:

{
  home.packages = with pkgs; [ claude-code ];
  home.sessionVariables = {
    CLAUDE_CODE_USE_VERTEX = "1";
    CLOUD_ML_REGION = "global";
    ANTHROPIC_VERTEX_PROJECT_ID = "random42-209114";
    ANTHROPIC_DEFAULT_MODEL = "claude-sonnet-5-5";
    CLAUDE_CODE_EFFORT_LEVEL = "medium";
    ANTHROPIC_DEFAULT_OPUS_MODEL = "claude-opus-5-5";
    ANTHROPIC_DEFAULT_SONNET_MODEL = "claude-sonnet-5-5";
    ANTHROPIC_DEFAULT_HAIKU_MODEL = "claude-haiku-5-5";
  };
}
