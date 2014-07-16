#VRundler
=========

[![Code Climate](http://img.shields.io/codeclimate/github/developwithpassion/vrundler.svg)][codeclimate]

[codeclimate]: https://codeclimate.com/github/developwithpassion/vrundler

##Description

vrundler is a simple tool for managing your vim plugins using ruby.

##Installation

```bash
gem install vrundler
```

##Usage and documentation

Create a configuration file for VRundler that allows you to specify the bundles you want vim to use. The following code is a configuration file that uses all of the features of vrundler:

```ruby
# Specify the path where you want your bundles installed
bundles_dir '/Users/developwithpassion/.vim_runtime/bundle'

# A github group allows you to specify a github user name
github 'vim-scripts' do

# A bundle is a named vim plugin repo for the user, you can specify
# multiple by separating each plugin with a comma, this is useful if you are
# getting multiple plugins from a single author, you can also specify each plugin
# with separate calls to: bundle '[PLUGIN]'
  bundle 'dbext.vim',
         'vimgrep.vim'
end

github :altercation do
  bundle 'vim-colors-solarized'
end

github :benmills do
  bundle 'vimux'
end

github :developwithpassion do
  bundle 'TwitVim'
end

# A symlink bundle is just a vim plugin that is on your local file system somewhere 
# and you want it symlinked into your vim bundle folder, the first argument is 
# the name the symlink will be given in your plugin folder
symlink :dwp_vim_general, '/to_backup/repositories/open_source/dwp_vim_general'

github :ecomba do
  bundle 'vim-ruby-refactoring'
end

github :elzr do
  bundle 'vim-json'
end

github :ervandew do
  bundle 'supertab'
end

github :nanotech do
  bundle 'jellybeans.vim'
end

github :kana do
  bundle 'vim-fakeclip'
end

github :kien do
  bundle 'ctrlp.vim'
end

github :MarcWeber do
  bundle 'vim-addon-mw-utils'
end

github :scrooloose do
  bundle 'syntastic' , 
    'nerdtree'
end

github :jistr do
  bundle 'vim-nerdtree-tabs'
end

github :sukima do
  bundle 'xmledit'
end

github :timcharper do
  bundle 'textile.vim'
end

github :thoughtbot do
  bundle 'vim-rspec'
end

github :pangloss do
  bundle 'vim-javascript'
end

github :SirVer do
  bundle 'ultisnips'
end

github :tomtom do
  bundle 'tcomment_vim', 
    'tlib_vim'
end

github :tpope do
  bundle 'vim-cucumber', 
    'vim-endwise', 
    'vim-fugitive', 
    'vim-git', 
    'vim-haml', 
    'vim-markdown', 
    'vim-rails', 
    'vim-repeat',
    'vim-surround', 
    'vim-vividchalk'
end

github :Lokaltog do
  bundle 'vim-distinguished'
end

github :Valloric do
  # This demonstrates configuring the bundle using a block, in this 
  # example I am chdir'ing into the bundle folder after it has downloaded
  # and running a system command to configure the plugin, in this case for 
  # YouCompleteMe it initializes its submodules and then installs 
  # the native extensions
  bundle 'YouCompleteMe' do |b, context|
    b.after_download do 
      Dir.chdir(context.output_folder(b)) do
        system("git submodule update --init --recursive && ./install.sh")
      end
    end
  end
  bundle 'MatchTagAlways'
end

github 'vim-ruby' do
  bundle 'vim-ruby'
end


# A vimscripts group allows you to pull down individual script files from vimscripts.org
vimscripts do
  
  # when you define a group inside a vimscripts section, the first arugment specifies
  # what type of plugin the script is
  group :plugins do
    script 'IndexedSearch', 7062
    script 'autotag', 12473
    script 'DirDiff', 13435
  end

  group :syntax do
    script 'jquery', 12276
  end
end

# A vimzips group allows you to pull down individual zip files from vimscripts.org
vimzips do
  zip :vimgrep, 3407 
  zip :bufexplorer, 20953
end
```

With the configuration file in place, if you are in the folder that contains the configuration file, you can just run: 


```bash
vrundler install
```

If not, you will need to provide a path to the configuration file as an argument:

```bash
vrundler install --config_file=PATH_TO_YOUR_CONFIG_FILE
```

##Caveats

* Minimalist type functionality
* Refactored from a script I wrote years ago, didn't write tests for it
* I've used it successfully for a long time (about 4 years). 
* It's optimized for my workflow. YMMV.

##License

Released under the MIT License. See the [LICENSE][] file for further details.

[license]: LICENSE.md
