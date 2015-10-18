


<!DOCTYPE html>
<html lang="en" class="">
  <head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# object: http://ogp.me/ns/object# article: http://ogp.me/ns/article# profile: http://ogp.me/ns/profile#">
    <meta charset='utf-8'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
    <meta name="viewport" content="width=1020">
    
    
    <title>osx-vm-templates/xcode-cli-tools.sh at 8a2d0be3b8c3d3ba81aa49e7930a2d65ed7e70fc · timsutton/osx-vm-templates · GitHub</title>
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub">
    <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub">
    <link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-114.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-144.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144.png">
    <meta property="fb:app_id" content="1401488693436528">

      <meta content="@github" name="twitter:site" /><meta content="summary" name="twitter:card" /><meta content="timsutton/osx-vm-templates" name="twitter:title" /><meta content="osx-vm-templates - OS X templates for Packer and VeeWee." name="twitter:description" /><meta content="https://avatars0.githubusercontent.com/u/119358?v=3&amp;s=400" name="twitter:image:src" />
      <meta content="GitHub" property="og:site_name" /><meta content="object" property="og:type" /><meta content="https://avatars0.githubusercontent.com/u/119358?v=3&amp;s=400" property="og:image" /><meta content="timsutton/osx-vm-templates" property="og:title" /><meta content="https://github.com/timsutton/osx-vm-templates" property="og:url" /><meta content="osx-vm-templates - OS X templates for Packer and VeeWee." property="og:description" />
      <meta name="browser-stats-url" content="https://api.github.com/_private/browser/stats">
    <meta name="browser-errors-url" content="https://api.github.com/_private/browser/errors">
    <link rel="assets" href="https://assets-cdn.github.com/">
    
    <meta name="pjax-timeout" content="1000">
    

    <meta name="msapplication-TileImage" content="/windows-tile.png">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="selected-link" value="repo_source" data-pjax-transient>

    <meta name="google-site-verification" content="KT5gs8h0wvaagLKAVWq8bbeNwnZZK1r1XQysX3xurLU">
    <meta name="google-analytics" content="UA-3769691-2">

<meta content="collector.githubapp.com" name="octolytics-host" /><meta content="github" name="octolytics-app-id" /><meta content="49BDB017:7D28:19586E6B:562308DC" name="octolytics-dimension-request_id" />

<meta content="Rails, view, blob#show" data-pjax-transient="true" name="analytics-event" />


  <meta class="js-ga-set" name="dimension1" content="Logged Out">
    <meta class="js-ga-set" name="dimension4" content="Current repo nav">




    <meta name="is-dotcom" content="true">
        <meta name="hostname" content="github.com">
    <meta name="user-login" content="">

      <link rel="mask-icon" href="https://assets-cdn.github.com/pinned-octocat.svg" color="#4078c0">
      <link rel="icon" type="image/x-icon" href="https://assets-cdn.github.com/favicon.ico">

    <meta content="80f7b0915bf3f88f8c034b6cd4f71746a17aab5b" name="form-nonce" />

    <link crossorigin="anonymous" href="https://assets-cdn.github.com/assets/github-1c72e5e1cbdeae0d6a25ee0e6f07ae0100db5696d3f5f10ed2acf1f0885ef5f0.css" media="all" rel="stylesheet" />
    <link crossorigin="anonymous" href="https://assets-cdn.github.com/assets/github2-91f10774cc492e563a1bcd77a9b935a21bffbda4c7fefb5ed448d51a53217852.css" media="all" rel="stylesheet" />
    
    
    


    <meta http-equiv="x-pjax-version" content="aaf0a95e6a9bf84b40427e5620ea23c2">

      
  <meta name="description" content="osx-vm-templates - OS X templates for Packer and VeeWee.">
  <meta name="go-import" content="github.com/timsutton/osx-vm-templates git https://github.com/timsutton/osx-vm-templates.git">

  <meta content="119358" name="octolytics-dimension-user_id" /><meta content="timsutton" name="octolytics-dimension-user_login" /><meta content="11501120" name="octolytics-dimension-repository_id" /><meta content="timsutton/osx-vm-templates" name="octolytics-dimension-repository_nwo" /><meta content="true" name="octolytics-dimension-repository_public" /><meta content="false" name="octolytics-dimension-repository_is_fork" /><meta content="11501120" name="octolytics-dimension-repository_network_root_id" /><meta content="timsutton/osx-vm-templates" name="octolytics-dimension-repository_network_root_nwo" />
  <link href="https://github.com/timsutton/osx-vm-templates/commits/8a2d0be3b8c3d3ba81aa49e7930a2d65ed7e70fc.atom" rel="alternate" title="Recent Commits to osx-vm-templates:8a2d0be3b8c3d3ba81aa49e7930a2d65ed7e70fc" type="application/atom+xml">

  </head>


  <body class="logged_out   env-production  vis-public page-blob">
    <a href="#start-of-content" tabindex="1" class="accessibility-aid js-skip-to-content">Skip to content</a>

    
    
    



      
      <div class="header header-logged-out" role="banner">
  <div class="container clearfix">

    <a class="header-logo-wordmark" href="https://github.com/" data-ga-click="(Logged out) Header, go to homepage, icon:logo-wordmark">
      <span class="mega-octicon octicon-logo-github"></span>
    </a>

    <div class="header-actions" role="navigation">
        <a class="btn btn-primary" href="/join" data-ga-click="(Logged out) Header, clicked Sign up, text:sign-up">Sign up</a>
      <a class="btn" href="/login?return_to=%2Ftimsutton%2Fosx-vm-templates%2Fblob%2F8a2d0be3b8c3d3ba81aa49e7930a2d65ed7e70fc%2Fscripts%2Fxcode-cli-tools.sh" data-ga-click="(Logged out) Header, clicked Sign in, text:sign-in">Sign in</a>
    </div>

    <div class="site-search repo-scope js-site-search" role="search">
      <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/timsutton/osx-vm-templates/search" class="js-site-search-form" data-global-search-url="/search" data-repo-search-url="/timsutton/osx-vm-templates/search" method="get"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div>
  <label class="js-chromeless-input-container form-control">
    <div class="scope-badge">This repository</div>
    <input type="text"
      class="js-site-search-focus js-site-search-field is-clearable chromeless-input"
      data-hotkey="s"
      name="q"
      placeholder="Search"
      aria-label="Search this repository"
      data-global-scope-placeholder="Search GitHub"
      data-repo-scope-placeholder="Search"
      tabindex="1"
      autocapitalize="off">
  </label>
</form>
    </div>

      <ul class="header-nav left" role="navigation">
          <li class="header-nav-item">
            <a class="header-nav-link" href="/explore" data-ga-click="(Logged out) Header, go to explore, text:explore">Explore</a>
          </li>
          <li class="header-nav-item">
            <a class="header-nav-link" href="/features" data-ga-click="(Logged out) Header, go to features, text:features">Features</a>
          </li>
          <li class="header-nav-item">
            <a class="header-nav-link" href="https://enterprise.github.com/" data-ga-click="(Logged out) Header, go to enterprise, text:enterprise">Enterprise</a>
          </li>
          <li class="header-nav-item">
            <a class="header-nav-link" href="/pricing" data-ga-click="(Logged out) Header, go to pricing, text:pricing">Pricing</a>
          </li>
      </ul>

  </div>
</div>



    <div id="start-of-content" class="accessibility-aid"></div>

    <div id="js-flash-container">
</div>


    <div role="main" class="main-content">
        <div itemscope itemtype="http://schema.org/WebPage">
    <div class="pagehead repohead instapaper_ignore readability-menu">

      <div class="container">

        <div class="clearfix">
          

<ul class="pagehead-actions">

  <li>
      <a href="/login?return_to=%2Ftimsutton%2Fosx-vm-templates"
    class="btn btn-sm btn-with-count tooltipped tooltipped-n"
    aria-label="You must be signed in to watch a repository" rel="nofollow">
    <span class="octicon octicon-eye"></span>
    Watch
  </a>
  <a class="social-count" href="/timsutton/osx-vm-templates/watchers">
    38
  </a>

  </li>

  <li>
      <a href="/login?return_to=%2Ftimsutton%2Fosx-vm-templates"
    class="btn btn-sm btn-with-count tooltipped tooltipped-n"
    aria-label="You must be signed in to star a repository" rel="nofollow">
    <span class="octicon octicon-star"></span>
    Star
  </a>

    <a class="social-count js-social-count" href="/timsutton/osx-vm-templates/stargazers">
      430
    </a>

  </li>

  <li>
      <a href="/login?return_to=%2Ftimsutton%2Fosx-vm-templates"
        class="btn btn-sm btn-with-count tooltipped tooltipped-n"
        aria-label="You must be signed in to fork a repository" rel="nofollow">
        <span class="octicon octicon-repo-forked"></span>
        Fork
      </a>

    <a href="/timsutton/osx-vm-templates/network" class="social-count">
      92
    </a>
  </li>
</ul>

          <h1 itemscope itemtype="http://data-vocabulary.org/Breadcrumb" class="entry-title public ">
  <span class="mega-octicon octicon-repo"></span>
  <span class="author"><a href="/timsutton" class="url fn" itemprop="url" rel="author"><span itemprop="title">timsutton</span></a></span><!--
--><span class="path-divider">/</span><!--
--><strong><a href="/timsutton/osx-vm-templates" data-pjax="#js-repo-pjax-container">osx-vm-templates</a></strong>

  <span class="page-context-loader">
    <img alt="" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
  </span>

</h1>

        </div>
      </div>
    </div>

    <div class="container">
      <div class="repository-with-sidebar repo-container new-discussion-timeline ">
        <div class="repository-sidebar clearfix">
          
<nav class="sunken-menu repo-nav js-repo-nav js-sidenav-container-pjax js-octicon-loaders"
     role="navigation"
     data-pjax="#js-repo-pjax-container"
     data-issue-count-url="/timsutton/osx-vm-templates/issues/counts">
  <ul class="sunken-menu-group">
    <li class="tooltipped tooltipped-w" aria-label="Code">
      <a href="/timsutton/osx-vm-templates" aria-label="Code" aria-selected="true" class="js-selected-navigation-item selected sunken-menu-item" data-hotkey="g c" data-selected-links="repo_source repo_downloads repo_commits repo_releases repo_tags repo_branches /timsutton/osx-vm-templates">
        <span class="octicon octicon-code"></span> <span class="full-word">Code</span>
        <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>    </li>

      <li class="tooltipped tooltipped-w" aria-label="Issues">
        <a href="/timsutton/osx-vm-templates/issues" aria-label="Issues" class="js-selected-navigation-item sunken-menu-item" data-hotkey="g i" data-selected-links="repo_issues repo_labels repo_milestones /timsutton/osx-vm-templates/issues">
          <span class="octicon octicon-issue-opened"></span> <span class="full-word">Issues</span>
          <span class="js-issue-replace-counter"></span>
          <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

    <li class="tooltipped tooltipped-w" aria-label="Pull requests">
      <a href="/timsutton/osx-vm-templates/pulls" aria-label="Pull requests" class="js-selected-navigation-item sunken-menu-item" data-hotkey="g p" data-selected-links="repo_pulls /timsutton/osx-vm-templates/pulls">
          <span class="octicon octicon-git-pull-request"></span> <span class="full-word">Pull requests</span>
          <span class="js-pull-replace-counter"></span>
          <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>    </li>

  </ul>
  <div class="sunken-menu-separator"></div>
  <ul class="sunken-menu-group">

    <li class="tooltipped tooltipped-w" aria-label="Pulse">
      <a href="/timsutton/osx-vm-templates/pulse" aria-label="Pulse" class="js-selected-navigation-item sunken-menu-item" data-selected-links="pulse /timsutton/osx-vm-templates/pulse">
        <span class="octicon octicon-pulse"></span> <span class="full-word">Pulse</span>
        <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>    </li>

    <li class="tooltipped tooltipped-w" aria-label="Graphs">
      <a href="/timsutton/osx-vm-templates/graphs" aria-label="Graphs" class="js-selected-navigation-item sunken-menu-item" data-selected-links="repo_graphs repo_contributors /timsutton/osx-vm-templates/graphs">
        <span class="octicon octicon-graph"></span> <span class="full-word">Graphs</span>
        <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>    </li>
  </ul>


</nav>

            <div class="only-with-full-nav">
                
<div class="js-clone-url clone-url open"
  data-protocol-type="http">
  <h3 class="text-small"><span class="text-emphasized">HTTPS</span> clone URL</h3>
  <div class="input-group js-zeroclipboard-container">
    <input type="text" class="input-mini text-small input-monospace js-url-field js-zeroclipboard-target"
           value="https://github.com/timsutton/osx-vm-templates.git" readonly="readonly" aria-label="HTTPS clone URL">
    <span class="input-group-button">
      <button aria-label="Copy to clipboard" class="js-zeroclipboard btn btn-sm zeroclipboard-button tooltipped tooltipped-s" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
    </span>
  </div>
</div>

  
<div class="js-clone-url clone-url "
  data-protocol-type="subversion">
  <h3 class="text-small"><span class="text-emphasized">Subversion</span> checkout URL</h3>
  <div class="input-group js-zeroclipboard-container">
    <input type="text" class="input-mini text-small input-monospace js-url-field js-zeroclipboard-target"
           value="https://github.com/timsutton/osx-vm-templates" readonly="readonly" aria-label="Subversion checkout URL">
    <span class="input-group-button">
      <button aria-label="Copy to clipboard" class="js-zeroclipboard btn btn-sm zeroclipboard-button tooltipped tooltipped-s" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
    </span>
  </div>
</div>



<div class="clone-options text-small">You can clone with
  <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/users/set_protocol?protocol_selector=http&amp;protocol_type=clone" class="inline-form js-clone-selector-form " data-form-nonce="80f7b0915bf3f88f8c034b6cd4f71746a17aab5b" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="ZHkTX5J3+sGK3OS9REmqE5lKFPLaNBXLSQq9QufE1knlRIxi5h6iTRBdyW6wKfnvvSn1Cwg8xlBF5368PgcDyA==" /></div><button class="btn-link js-clone-selector" data-protocol="http" type="submit">HTTPS</button></form> or <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/users/set_protocol?protocol_selector=subversion&amp;protocol_type=clone" class="inline-form js-clone-selector-form " data-form-nonce="80f7b0915bf3f88f8c034b6cd4f71746a17aab5b" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="guAS7hriId7bTumfCzLTZzKZ0KWJ6wl+bHno0hfJ3bBZZ9neUn8OHs5EdDZbze/SL4VrIhFOylsPr+3AEu0oLg==" /></div><button class="btn-link js-clone-selector" data-protocol="subversion" type="submit">Subversion</button></form>.
  <a href="https://help.github.com/articles/which-remote-url-should-i-use" class="help tooltipped tooltipped-n" aria-label="Get help on which URL is right for you.">
    <span class="octicon octicon-question"></span>
  </a>
</div>

              <a href="/timsutton/osx-vm-templates/archive/8a2d0be3b8c3d3ba81aa49e7930a2d65ed7e70fc.zip"
                 class="btn btn-sm sidebar-button"
                 aria-label="Download the contents of timsutton/osx-vm-templates as a zip file"
                 title="Download the contents of timsutton/osx-vm-templates as a zip file"
                 rel="nofollow">
                <span class="octicon octicon-cloud-download"></span>
                Download ZIP
              </a>
            </div>
        </div>
        <div id="js-repo-pjax-container" class="repository-content context-loader-container" data-pjax-container>

          

<a href="/timsutton/osx-vm-templates/blob/8a2d0be3b8c3d3ba81aa49e7930a2d65ed7e70fc/scripts/xcode-cli-tools.sh" class="hidden js-permalink-shortcut" data-hotkey="y">Permalink</a>

<!-- blob contrib key: blob_contributors:v21:fc7a69c14035d493b912523b98da7248 -->

  <div class="file-navigation js-zeroclipboard-container">
    
<div class="select-menu js-menu-container js-select-menu left">
  <button class="btn btn-sm select-menu-button js-menu-target css-truncate" data-hotkey="w"
    title=""
    type="button" aria-label="Switch branches or tags" tabindex="0" aria-haspopup="true">
    <i>Tree:</i>
    <span class="js-select-button css-truncate-target">8a2d0be3b8</span>
  </button>

  <div class="select-menu-modal-holder js-menu-content js-navigation-container" data-pjax aria-hidden="true">

    <div class="select-menu-modal">
      <div class="select-menu-header">
        <span class="select-menu-title">Switch branches/tags</span>
        <span class="octicon octicon-x js-menu-close" role="button" aria-label="Close"></span>
      </div>

      <div class="select-menu-filters">
        <div class="select-menu-text-filter">
          <input type="text" aria-label="Filter branches/tags" id="context-commitish-filter-field" class="js-filterable-field js-navigation-enable" placeholder="Filter branches/tags">
        </div>
        <div class="select-menu-tabs">
          <ul>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="branches" data-filter-placeholder="Filter branches/tags" class="js-select-menu-tab" role="tab">Branches</a>
            </li>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="tags" data-filter-placeholder="Find a tag…" class="js-select-menu-tab" role="tab">Tags</a>
            </li>
          </ul>
        </div>
      </div>

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="branches" role="menu">

        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/timsutton/osx-vm-templates/blob/master/scripts/xcode-cli-tools.sh"
               data-name="master"
               data-skip-pjax="true"
               rel="nofollow">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <span class="select-menu-item-text css-truncate-target" title="master">
                master
              </span>
            </a>
        </div>

          <div class="select-menu-no-results">Nothing to show</div>
      </div>

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="tags">
        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


        </div>

        <div class="select-menu-no-results">Nothing to show</div>
      </div>

    </div>
  </div>
</div>

    <div class="btn-group right">
      <a href="/timsutton/osx-vm-templates/find/8a2d0be3b8c3d3ba81aa49e7930a2d65ed7e70fc"
            class="js-show-file-finder btn btn-sm empty-icon tooltipped tooltipped-nw"
            data-pjax
            data-hotkey="t"
            aria-label="Quickly jump between files">
        <span class="octicon octicon-list-unordered"></span>
      </a>
      <button aria-label="Copy file path to clipboard" class="js-zeroclipboard btn btn-sm zeroclipboard-button tooltipped tooltipped-s" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
    </div>

    <div class="breadcrumb js-zeroclipboard-target">
      <span class="repo-root js-repo-root"><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/timsutton/osx-vm-templates/tree/8a2d0be3b8c3d3ba81aa49e7930a2d65ed7e70fc" class="" data-branch="8a2d0be3b8c3d3ba81aa49e7930a2d65ed7e70fc" data-pjax="true" itemscope="url" rel="nofollow"><span itemprop="title">osx-vm-templates</span></a></span></span><span class="separator">/</span><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/timsutton/osx-vm-templates/tree/8a2d0be3b8c3d3ba81aa49e7930a2d65ed7e70fc/scripts" class="" data-branch="8a2d0be3b8c3d3ba81aa49e7930a2d65ed7e70fc" data-pjax="true" itemscope="url" rel="nofollow"><span itemprop="title">scripts</span></a></span><span class="separator">/</span><strong class="final-path">xcode-cli-tools.sh</strong>
    </div>
  </div>


  <div class="commit-tease">
      <span class="right">
        <a class="commit-tease-sha" href="/timsutton/osx-vm-templates/commit/8a2d0be3b8c3d3ba81aa49e7930a2d65ed7e70fc" data-pjax>
          8a2d0b
        </a>
        <time datetime="2015-10-17T14:08:11Z" is="relative-time">Oct 17, 2015</time>
      </span>
      <div>
        <img alt="@timsutton" class="avatar" height="20" src="https://avatars0.githubusercontent.com/u/119358?v=3&amp;s=40" width="20" />
        <a href="/timsutton" class="user-mention" rel="author">timsutton</a>
          <a href="/timsutton/osx-vm-templates/commit/8a2d0be3b8c3d3ba81aa49e7930a2d65ed7e70fc" class="message" data-pjax="true" title="Fix expired cert for CLI tools installation on Lion">Fix expired cert for CLI tools installation on Lion</a>
      </div>

    <div class="commit-tease-contributors">
      <a class="muted-link contributors-toggle" href="#blob_contributors_box" rel="facebox">
        <strong>4</strong>
         contributors
      </a>
          <a class="avatar-link tooltipped tooltipped-s" aria-label="timsutton" href="/timsutton/osx-vm-templates/commits/8a2d0be3b8c3d3ba81aa49e7930a2d65ed7e70fc/scripts/xcode-cli-tools.sh?author=timsutton"><img alt="@timsutton" class="avatar" height="20" src="https://avatars0.githubusercontent.com/u/119358?v=3&amp;s=40" width="20" /> </a>
    <a class="avatar-link tooltipped tooltipped-s" aria-label="radeksimko" href="/timsutton/osx-vm-templates/commits/8a2d0be3b8c3d3ba81aa49e7930a2d65ed7e70fc/scripts/xcode-cli-tools.sh?author=radeksimko"><img alt="@radeksimko" class="avatar" height="20" src="https://avatars0.githubusercontent.com/u/287584?v=3&amp;s=40" width="20" /> </a>
    <a class="avatar-link tooltipped tooltipped-s" aria-label="gotcha" href="/timsutton/osx-vm-templates/commits/8a2d0be3b8c3d3ba81aa49e7930a2d65ed7e70fc/scripts/xcode-cli-tools.sh?author=gotcha"><img alt="@gotcha" class="avatar" height="20" src="https://avatars2.githubusercontent.com/u/105204?v=3&amp;s=40" width="20" /> </a>
    <a class="avatar-link tooltipped tooltipped-s" aria-label="abradner" href="/timsutton/osx-vm-templates/commits/8a2d0be3b8c3d3ba81aa49e7930a2d65ed7e70fc/scripts/xcode-cli-tools.sh?author=abradner"><img alt="@abradner" class="avatar" height="20" src="https://avatars1.githubusercontent.com/u/445235?v=3&amp;s=40" width="20" /> </a>


    </div>

    <div id="blob_contributors_box" style="display:none">
      <h2 class="facebox-header" data-facebox-id="facebox-header">Users who have contributed to this file</h2>
      <ul class="facebox-user-list" data-facebox-id="facebox-description">
          <li class="facebox-user-list-item">
            <img alt="@timsutton" height="24" src="https://avatars2.githubusercontent.com/u/119358?v=3&amp;s=48" width="24" />
            <a href="/timsutton">timsutton</a>
          </li>
          <li class="facebox-user-list-item">
            <img alt="@radeksimko" height="24" src="https://avatars2.githubusercontent.com/u/287584?v=3&amp;s=48" width="24" />
            <a href="/radeksimko">radeksimko</a>
          </li>
          <li class="facebox-user-list-item">
            <img alt="@gotcha" height="24" src="https://avatars0.githubusercontent.com/u/105204?v=3&amp;s=48" width="24" />
            <a href="/gotcha">gotcha</a>
          </li>
          <li class="facebox-user-list-item">
            <img alt="@abradner" height="24" src="https://avatars3.githubusercontent.com/u/445235?v=3&amp;s=48" width="24" />
            <a href="/abradner">abradner</a>
          </li>
      </ul>
    </div>
  </div>

<div class="file">
  <div class="file-header">
  <div class="file-actions">

    <div class="btn-group">
      <a href="/timsutton/osx-vm-templates/raw/8a2d0be3b8c3d3ba81aa49e7930a2d65ed7e70fc/scripts/xcode-cli-tools.sh" class="btn btn-sm " id="raw-url">Raw</a>
        <a href="/timsutton/osx-vm-templates/blame/8a2d0be3b8c3d3ba81aa49e7930a2d65ed7e70fc/scripts/xcode-cli-tools.sh" class="btn btn-sm js-update-url-with-hash">Blame</a>
      <a href="/timsutton/osx-vm-templates/commits/8a2d0be3b8c3d3ba81aa49e7930a2d65ed7e70fc/scripts/xcode-cli-tools.sh" class="btn btn-sm " rel="nofollow">History</a>
    </div>


        <button type="button" class="octicon-btn disabled tooltipped tooltipped-nw"
          aria-label="You must be signed in to make or propose changes">
          <span class="octicon octicon-pencil"></span>
        </button>
        <button type="button" class="octicon-btn octicon-btn-danger disabled tooltipped tooltipped-nw"
          aria-label="You must be signed in to make or propose changes">
          <span class="octicon octicon-trashcan"></span>
        </button>
  </div>

  <div class="file-info">
      <span class="file-mode" title="File mode">executable file</span>
      <span class="file-info-divider"></span>
      40 lines (35 sloc)
      <span class="file-info-divider"></span>
    1.78 KB
  </div>
</div>

  

  <div class="blob-wrapper data type-shell">
      <table class="highlight tab-size js-file-line-container" data-tab-size="8">
      <tr>
        <td id="L1" class="blob-num js-line-number" data-line-number="1"></td>
        <td id="LC1" class="blob-code blob-code-inner js-file-line"><span class="pl-c">#!/bin/sh</span></td>
      </tr>
      <tr>
        <td id="L2" class="blob-num js-line-number" data-line-number="2"></td>
        <td id="LC2" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L3" class="blob-num js-line-number" data-line-number="3"></td>
        <td id="LC3" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># Get and install Xcode CLI tools</span></td>
      </tr>
      <tr>
        <td id="L4" class="blob-num js-line-number" data-line-number="4"></td>
        <td id="LC4" class="blob-code blob-code-inner js-file-line">OSX_VERS=<span class="pl-s"><span class="pl-pds">$(</span>sw_vers -productVersion <span class="pl-k">|</span> awk -F <span class="pl-s"><span class="pl-pds">&quot;</span>.<span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&#39;</span>{print $2}<span class="pl-pds">&#39;</span></span><span class="pl-pds">)</span></span></td>
      </tr>
      <tr>
        <td id="L5" class="blob-num js-line-number" data-line-number="5"></td>
        <td id="LC5" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L6" class="blob-num js-line-number" data-line-number="6"></td>
        <td id="LC6" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># on 10.9+, we can leverage SUS to get the latest CLI tools</span></td>
      </tr>
      <tr>
        <td id="L7" class="blob-num js-line-number" data-line-number="7"></td>
        <td id="LC7" class="blob-code blob-code-inner js-file-line"><span class="pl-k">if</span> [ <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">$OSX_VERS</span><span class="pl-pds">&quot;</span></span> -ge 9 ]<span class="pl-k">;</span> <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L8" class="blob-num js-line-number" data-line-number="8"></td>
        <td id="LC8" class="blob-code blob-code-inner js-file-line">    <span class="pl-c"># create the placeholder file that&#39;s checked by CLI updates&#39; .dist code</span></td>
      </tr>
      <tr>
        <td id="L9" class="blob-num js-line-number" data-line-number="9"></td>
        <td id="LC9" class="blob-code blob-code-inner js-file-line">    <span class="pl-c"># in Apple&#39;s SUS catalog</span></td>
      </tr>
      <tr>
        <td id="L10" class="blob-num js-line-number" data-line-number="10"></td>
        <td id="LC10" class="blob-code blob-code-inner js-file-line">    touch /tmp/.com.apple.dt.CommandLineTools.installondemand.<span class="pl-k">in</span>-progress</td>
      </tr>
      <tr>
        <td id="L11" class="blob-num js-line-number" data-line-number="11"></td>
        <td id="LC11" class="blob-code blob-code-inner js-file-line">    <span class="pl-c"># find the CLI Tools update</span></td>
      </tr>
      <tr>
        <td id="L12" class="blob-num js-line-number" data-line-number="12"></td>
        <td id="LC12" class="blob-code blob-code-inner js-file-line">    PROD=<span class="pl-s"><span class="pl-pds">$(</span>softwareupdate -l <span class="pl-k">|</span> grep <span class="pl-s"><span class="pl-pds">&quot;</span>\*.*Command Line<span class="pl-pds">&quot;</span></span> <span class="pl-k">|</span> head -n 1 <span class="pl-k">|</span> awk -F<span class="pl-s"><span class="pl-pds">&quot;</span>*<span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&#39;</span>{print $2}<span class="pl-pds">&#39;</span></span> <span class="pl-k">|</span> sed -e <span class="pl-s"><span class="pl-pds">&#39;</span>s/^ *//<span class="pl-pds">&#39;</span></span> <span class="pl-k">|</span> tr -d <span class="pl-s"><span class="pl-pds">&#39;</span>\n<span class="pl-pds">&#39;</span></span><span class="pl-pds">)</span></span></td>
      </tr>
      <tr>
        <td id="L13" class="blob-num js-line-number" data-line-number="13"></td>
        <td id="LC13" class="blob-code blob-code-inner js-file-line">    <span class="pl-c"># install it</span></td>
      </tr>
      <tr>
        <td id="L14" class="blob-num js-line-number" data-line-number="14"></td>
        <td id="LC14" class="blob-code blob-code-inner js-file-line">    softwareupdate -i <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">$PROD</span><span class="pl-pds">&quot;</span></span> -v</td>
      </tr>
      <tr>
        <td id="L15" class="blob-num js-line-number" data-line-number="15"></td>
        <td id="LC15" class="blob-code blob-code-inner js-file-line">    rm /tmp/.com.apple.dt.CommandLineTools.installondemand.<span class="pl-k">in</span>-progress</td>
      </tr>
      <tr>
        <td id="L16" class="blob-num js-line-number" data-line-number="16"></td>
        <td id="LC16" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L17" class="blob-num js-line-number" data-line-number="17"></td>
        <td id="LC17" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># on 10.7/10.8, we instead download from public download URLs, which can be found in</span></td>
      </tr>
      <tr>
        <td id="L18" class="blob-num js-line-number" data-line-number="18"></td>
        <td id="LC18" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># the dvtdownloadableindex:</span></td>
      </tr>
      <tr>
        <td id="L19" class="blob-num js-line-number" data-line-number="19"></td>
        <td id="LC19" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># https://devimages.apple.com.edgekey.net/downloads/xcode/simulators/index-3905972D-B609-49CE-8D06-51ADC78E07BC.dvtdownloadableindex</span></td>
      </tr>
      <tr>
        <td id="L20" class="blob-num js-line-number" data-line-number="20"></td>
        <td id="LC20" class="blob-code blob-code-inner js-file-line"><span class="pl-k">else</span></td>
      </tr>
      <tr>
        <td id="L21" class="blob-num js-line-number" data-line-number="21"></td>
        <td id="LC21" class="blob-code blob-code-inner js-file-line">    [ <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">$OSX_VERS</span><span class="pl-pds">&quot;</span></span> -eq 7 ] <span class="pl-k">&amp;&amp;</span> DMGURL=http://devimages.apple.com.edgekey.net/downloads/xcode/command_line_tools_for_xcode_os_x_lion_april_2013.dmg</td>
      </tr>
      <tr>
        <td id="L22" class="blob-num js-line-number" data-line-number="22"></td>
        <td id="LC22" class="blob-code blob-code-inner js-file-line">    [ <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">$OSX_VERS</span><span class="pl-pds">&quot;</span></span> -eq 8 ] <span class="pl-k">&amp;&amp;</span> DMGURL=http://devimages.apple.com.edgekey.net/downloads/xcode/command_line_tools_for_osx_mountain_lion_april_2014.dmg</td>
      </tr>
      <tr>
        <td id="L23" class="blob-num js-line-number" data-line-number="23"></td>
        <td id="LC23" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L24" class="blob-num js-line-number" data-line-number="24"></td>
        <td id="LC24" class="blob-code blob-code-inner js-file-line">    TOOLS=clitools.dmg</td>
      </tr>
      <tr>
        <td id="L25" class="blob-num js-line-number" data-line-number="25"></td>
        <td id="LC25" class="blob-code blob-code-inner js-file-line">    curl <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">$DMGURL</span><span class="pl-pds">&quot;</span></span> -o <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">$TOOLS</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L26" class="blob-num js-line-number" data-line-number="26"></td>
        <td id="LC26" class="blob-code blob-code-inner js-file-line">    TMPMOUNT=<span class="pl-s"><span class="pl-pds">`</span>/usr/bin/mktemp -d /tmp/clitools.XXXX<span class="pl-pds">`</span></span></td>
      </tr>
      <tr>
        <td id="L27" class="blob-num js-line-number" data-line-number="27"></td>
        <td id="LC27" class="blob-code blob-code-inner js-file-line">    hdiutil attach <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">$TOOLS</span><span class="pl-pds">&quot;</span></span> -mountpoint <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">$TMPMOUNT</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L28" class="blob-num js-line-number" data-line-number="28"></td>
        <td id="LC28" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">if</span> [ <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">$OSX_VERS</span><span class="pl-pds">&quot;</span></span> -eq 7 ]<span class="pl-k">;</span> <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L29" class="blob-num js-line-number" data-line-number="29"></td>
        <td id="LC29" class="blob-code blob-code-inner js-file-line">        <span class="pl-c"># using &#39;-allowUntrusted&#39; because Lion CLI tools are so old Apple never built another</span></td>
      </tr>
      <tr>
        <td id="L30" class="blob-num js-line-number" data-line-number="30"></td>
        <td id="LC30" class="blob-code blob-code-inner js-file-line">        <span class="pl-c"># package that doesn&#39;t have an expired CA cert. (Expired February 15, 2015)</span></td>
      </tr>
      <tr>
        <td id="L31" class="blob-num js-line-number" data-line-number="31"></td>
        <td id="LC31" class="blob-code blob-code-inner js-file-line">        installer -pkg <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span>find <span class="pl-smi">$TMPMOUNT</span> -name <span class="pl-s"><span class="pl-pds">&#39;</span>*.mpkg<span class="pl-pds">&#39;</span></span><span class="pl-pds">)</span></span><span class="pl-pds">&quot;</span></span> -allowUntrusted -target /</td>
      </tr>
      <tr>
        <td id="L32" class="blob-num js-line-number" data-line-number="32"></td>
        <td id="LC32" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">else</span></td>
      </tr>
      <tr>
        <td id="L33" class="blob-num js-line-number" data-line-number="33"></td>
        <td id="LC33" class="blob-code blob-code-inner js-file-line">        installer -pkg <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span>find <span class="pl-smi">$TMPMOUNT</span> -name <span class="pl-s"><span class="pl-pds">&#39;</span>*.mpkg<span class="pl-pds">&#39;</span></span><span class="pl-pds">)</span></span><span class="pl-pds">&quot;</span></span> -target /</td>
      </tr>
      <tr>
        <td id="L34" class="blob-num js-line-number" data-line-number="34"></td>
        <td id="LC34" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">fi</span></td>
      </tr>
      <tr>
        <td id="L35" class="blob-num js-line-number" data-line-number="35"></td>
        <td id="LC35" class="blob-code blob-code-inner js-file-line">    hdiutil detach <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">$TMPMOUNT</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L36" class="blob-num js-line-number" data-line-number="36"></td>
        <td id="LC36" class="blob-code blob-code-inner js-file-line">    rm -rf <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">$TMPMOUNT</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L37" class="blob-num js-line-number" data-line-number="37"></td>
        <td id="LC37" class="blob-code blob-code-inner js-file-line">    rm <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">$TOOLS</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L38" class="blob-num js-line-number" data-line-number="38"></td>
        <td id="LC38" class="blob-code blob-code-inner js-file-line">    <span class="pl-c1">exit</span></td>
      </tr>
      <tr>
        <td id="L39" class="blob-num js-line-number" data-line-number="39"></td>
        <td id="LC39" class="blob-code blob-code-inner js-file-line"><span class="pl-k">fi</span></td>
      </tr>
</table>

  </div>

</div>

<a href="#jump-to-line" rel="facebox[.linejump]" data-hotkey="l" style="display:none">Jump to Line</a>
<div id="jump-to-line" style="display:none">
  <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="" class="js-jump-to-line-form" method="get"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div>
    <input class="linejump-input js-jump-to-line-field" type="text" placeholder="Jump to line&hellip;" aria-label="Jump to line" autofocus>
    <button type="submit" class="btn">Go</button>
</form></div>

        </div>
      </div>
      <div class="modal-backdrop"></div>
    </div>
  </div>


    </div>

      <div class="container">
  <div class="site-footer" role="contentinfo">
    <ul class="site-footer-links right">
        <li><a href="https://status.github.com/" data-ga-click="Footer, go to status, text:status">Status</a></li>
      <li><a href="https://developer.github.com" data-ga-click="Footer, go to api, text:api">API</a></li>
      <li><a href="https://training.github.com" data-ga-click="Footer, go to training, text:training">Training</a></li>
      <li><a href="https://shop.github.com" data-ga-click="Footer, go to shop, text:shop">Shop</a></li>
        <li><a href="https://github.com/blog" data-ga-click="Footer, go to blog, text:blog">Blog</a></li>
        <li><a href="https://github.com/about" data-ga-click="Footer, go to about, text:about">About</a></li>
        <li><a href="https://github.com/pricing" data-ga-click="Footer, go to pricing, text:pricing">Pricing</a></li>

    </ul>

    <a href="https://github.com" aria-label="Homepage">
      <span class="mega-octicon octicon-mark-github" title="GitHub"></span>
</a>
    <ul class="site-footer-links">
      <li>&copy; 2015 <span title="0.03532s from github-fe142-cp1-prd.iad.github.net">GitHub</span>, Inc.</li>
        <li><a href="https://github.com/site/terms" data-ga-click="Footer, go to terms, text:terms">Terms</a></li>
        <li><a href="https://github.com/site/privacy" data-ga-click="Footer, go to privacy, text:privacy">Privacy</a></li>
        <li><a href="https://github.com/security" data-ga-click="Footer, go to security, text:security">Security</a></li>
        <li><a href="https://github.com/contact" data-ga-click="Footer, go to contact, text:contact">Contact</a></li>
        <li><a href="https://help.github.com" data-ga-click="Footer, go to help, text:help">Help</a></li>
    </ul>
  </div>
</div>



    
    
    

    <div id="ajax-error-message" class="flash flash-error">
      <span class="octicon octicon-alert"></span>
      <button type="button" class="flash-close js-flash-close js-ajax-error-dismiss" aria-label="Dismiss error">
        <span class="octicon octicon-x"></span>
      </button>
      Something went wrong with that request. Please try again.
    </div>


      <script crossorigin="anonymous" src="https://assets-cdn.github.com/assets/frameworks-080f1c155a28f5a4315d4a6862aeafb7e27bca0a74db6f7ae9e0048e321369d1.js"></script>
      <script async="async" crossorigin="anonymous" src="https://assets-cdn.github.com/assets/github-ac033f0062bd3f47c468d3da839d615dff91cfcf0e416ea0a0099fbcd4483aba.js"></script>
      
      
    <div class="js-stale-session-flash stale-session-flash flash flash-warn flash-banner hidden">
      <span class="octicon octicon-alert"></span>
      <span class="signed-in-tab-flash">You signed in with another tab or window. <a href="">Reload</a> to refresh your session.</span>
      <span class="signed-out-tab-flash">You signed out in another tab or window. <a href="">Reload</a> to refresh your session.</span>
    </div>
  </body>
</html>

