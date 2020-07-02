# zsh-custom-functions

zsh plugin for loading my personal zsh custom functions

## Table of content

- [zsh-custom-functions](#zsh-custom-functions)
  - [Usage](#usage)
  - [License](#license)

## Usage

Once the plugin installed, `custom-functions` will be available

- Using [Antigen](https://github.com/zsh-users/antigen)

Bundle `zsh-custom-functions` in your `.zshrc`

```shell script
antigen bundle ptavares/zsh-custom-functions
```

- Using [zplug](https://github.com/b4b4r07/zplug)

Load `zsh-custom-functions` as a plugin in your `.zshrc`

```shell script
zplug "ptavares/zsh-custom-functions"
```

- Using [zgen](https://github.com/tarjoilija/zgen)

Include the load command in your `.zshrc`

```shell script
zget load ptavares/zsh-custom-functions
```

- As an [Oh My ZSH!](https://github.com/robbyrussell/oh-my-zsh) custom plugin

Clone `zsh-custom-functions` into your custom plugins repo and load as a plugin in your `.zshrc`

```shell script
git clone https://github.com/ptavares/zsh-custom-functions.git ~/.oh-my-zsh/custom/plugins/zsh-custom-functions
```

```shell script
plugins+=(zsh-custom-functions)
```

Keep in mind that plugins need to be added before `oh-my-zsh.sh` is sourced.

- Manually

Clone this repository somewhere (`~/.zsh-custom-functions` for example) and source it in your `.zshrc`

```shell script
git clone https://github.com/ptavares/zsh-custom-functions ~/.zsh-custom-functions
```

```shell script
source ~/.zsh-custom-functions/zsh-custom-functions.plugin.zsh
```

## License

[MIT](LICENCE)
