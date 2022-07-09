# DWSK-PDE
This is reuslt of countless weeks worth of research from many awesome neovim configs provided by various creators. The major takeaway i take from this journey of switching to neovim and seraching for a perfect config is there exist no thing such as a perfect settings.

## "Perfectionism is self abuse of the highest order" -- Annnie Wilson Schaef.

**Table of Contents**

[TOCM]

[TOC]

### Features
- Eyecandy themes, icons, statusbar and more...
- Easy Switch of themes, bars and icons according to the choice.
- LSP, Formatting, Linting Support for Development of: JS/TS, React, Python, Rust, C/C++, Go out of the box.
- Easy KeyBindings and Configs;
- No Breaking chages and packages are based on commits and will update according to the your own needs.
- Support for Markdown, Orgmode ...etc.
- Optimized and LazyLoaded for fast Loadspeed.


###  Keybinds:

## Custom Key-mappings

Note that,

- **Leader** key set as <kbd>Space</kbd>

<details open>
  <summary>
    <strong>Key-mappings</strong>
    <small><i>(🔎 Click to expand/collapse)</i></small>
  </summary>

<center>Modes: 𝐍=normal 𝐕=visual 𝐒=select 𝐈=insert 𝐂=command</center>

### UI

| Key                                                           | Mode | Action              | Plugin or Mapping                             |
| ------------------------------------------------------------- | :--: | ------------------- | --------------------------------------------- |
| <kbd>Space</kbd>+<kbd>e</kbd>                                 |  𝐍   | Open file tree      | <small>NvimTree</small>                       |
| <kbd>Space</kbd>+<kbd>o</kbd>                                 |  𝐍   | Open symbols        | <small>Symbols-outline</small>                |
| <kbd>Space</kbd>+<kbd>f</kbd>                                 |  𝐍   | Open file finder    | <small>Telescope</small>                      |
| <kbd>Space</kbd>+<kbd>h</kbd>                                 |  𝐍   | Remove highlight    | <small>`nohlsearch<`</small>                  |
| <kbd>Space</kbd>+<kbd>/</kbd>                                 |  𝐍   | Toggle comment      | <small>Comment.nvim</small>                   |
| <kbd>Ctrl</kbd>+<kbd>xt</kbd>                                  |  𝐈   | Open terminal       | <small>toggleterm.nvim</small>                |
<!-- | <kbd>Space</kbd>+<kbd>?</kbd>                                 |  𝐍   | Open cheats         | <small>cheat.sh</small>                       | -->
<!-- | <kbd>Space</kbd>+<kbd>'</kbd>                                 |  𝐍   | Open marks          | <small>which-key marks</small>                | -->
<!-- | <kbd>Space</kbd>+<kbd>z</kbd>                                 |  𝐍   | Zen mode            | <small>zen-mode.nvim</small>                  | -->
<!-- | <kbd>Space</kbd>+<kbd>P</kbd>                                 |  𝐍   | Projects            | <small>project.nvim</small>                   | -->
<!-- | <kbd>Ctrl</kbd>+<kbd>s</kbd>                                  |  𝐈   | Show signature help | <small>`vim.lsp.buf.signature_help()`</small> | -->
<!-- | <kbd>Alt</kbd>+<kbd>s</kbd>                                   |  𝐈   | Snippet selection   | <small>Telescope luasnip extension</small>    | -->
<!-- | <kbd>Space</kbd>+<kbd>C</kbd> or <kbd>Ctrl</kbd>+<kbd>P</kbd> |  𝐍   | Command Palette     | <small>Telescope command_center</small>       | -->

<!-- ### Motion -->
<!-- | Key                         | Mode | Action                  | Plugin or Mapping                                                   | -->
<!-- | --------------------------- | :--: | ----------------------- | ------------------------------------------------------------------- | -->
<!-- | <kbd>f</kbd>                |  𝐍   | find next character     | <small>HopChar1CurrentLineAC</small> or <small>Lightspeed_f</small> | -->
<!-- | <kbd>F</kbd>                |  𝐍   | find previous character | <small>HopChar1CurrentLineBC</small> or <small>Lightspeed_F</small> | -->
<!-- | <kbd>s</kbd>                |  𝐍   | find character          | <small>HopChar2MW</small> or <small>Lightspeed_s</small>            | -->
<!-- | <kbd>S</kbd>                |  𝐍   | find word               | <small>HopWordMW</small> or <small>Lightspeed_S</small>             | -->
<!-- | <kbd>Alt</kbd>+<kbd>a</kbd> |  𝐈   | select all              | <small>ggVG</small>                                                 | -->
<!-- | <kbd>Alt</kbd>+<kbd>a</kbd> |  𝐍   | increment number        | <small>C-A</small>                                                  | -->
<!-- | <kbd>Alt</kbd>+<kbd>x</kbd> |  𝐍   | decrement number        | <small>C-X</small>                                                  | -->
<!---->

### LSP

| Key                                                                                      | Mode | Action                              |
| ---------------------------------------------------------------------------------------- | :--: | ----------------------------------- |
| <kbd>Tab</kbd> / <kbd>Shift-Tab</kbd>                                                    |  𝐈   | Navigate completion-menu            |
| <kbd>Enter</kbd>                                                                         |  𝐈   | Select completion or expand snippet |
| <kbd>Up</kbd>or <kbd>Down</kbd>                                                          |  𝐈   | Movement in completion pop-up       |
| <kbd>Ctrl</kbd>+<kbd>e</kbd>                                                             |  𝐈   | Close pop-up                        |
| <kbd>Tab</kbd> / <kbd>Shift-Tab</kbd>                                                    | 𝐈 𝐒  | Navigate snippet placeholders       |
| <kbd>g</kbd>+<kbd>d</kbd>                                                                |  𝐍   | goto definition                     |
| <kbd>g</kbd>+<kbd>t</kbd>                                                                |  𝐍   | goto type definition                |
| <kbd>g</kbd>+<kbd>D</kbd>                                                                |  𝐍   | goto declaration                    |
| <kbd>g</kbd>+<kbd>I</kbd>                                                                |  𝐍   | goto implementation                 |
| <kbd>g</kbd>+<kbd>r</kbd>                                                                |  𝐍   | goto references                     |
| <kbd>g</kbd>+<kbd>f</kbd>                                                                |  𝐍   | open diagnostic float               |
| <kbd>g</kbd>+<kbd>s</kbd>                                                                |  𝐍   | show signature help                 |
| <kbd>K</kbd>                                                                             |  𝐍   | Lsp Hover                           |
| <kbd>leader</kbd>+<kbd>lr</kbd>                                                          |  𝐍   | lsp rename                          |
| <kbd>leader</kbd>+<kbd>li</kbd>                                                          |  𝐍   | lsp info                            |
| <kbd>leader</kbd>+<kbd>lI</kbd>                                                          |  𝐍   | lsp install info                    |
| <kbd>leader</kbd>+<kbd>la</kbd>                                                          |  𝐍   | code actions                        |
| <kbd>leader</kbd>+<kbd>lq</kbd>                                                          |  𝐍   | diagonstic loclist                  |
| <kbd>leader</kbd>+<kbd>j</kbd>                                                           |  𝐍   | Next diagnostic                     |
| <kbd>leader</kbd>+<kbd>k</kbd>                                                           |  𝐍   | Previous diagnostic                 |
<!-- | <kbd>Space</kbd>+<kbd>l</kbd>+<kbd>r</kbd>                                               |  𝐍   | replace current word in project     | -->
<!-- | <kbd>g</kbd>+<kbd>p</kbd>                                                                |  𝐍   | peek implementation                 | -->





### Plugin: Symbol Outline

| Key                                        | Mode | Action                              |
| ------------------------------------------ | :--: | ----------------------------        |
| <kbd>Esc/q</kbd>                           |  𝐍   | Close Outline                       |
| <kbd>Enter</kbd>                           |  𝐍   | Go to location                      |
| <kbd>o</kbd>                               |  𝐍   | Go to location without loosing focus|
| <kbd>Ctrl</kbd>+<kbd>Space</kbd>           |  𝐍   | Go to location                      |
| <kbd>K</kbd>                               |  𝐍   | Toggle Symbol Preview               |
| <kbd>r</kbd>                               |  𝐍   | Rename Symbol                       |
| <kbd>a</kbd>                               |  𝐍   | Code Actions                        |
| <kbd>?</kbd>                               |  𝐍   | Help                                |
<!---->
<!-- ### Plugin: AsyncTasks -->
<!-- | Key                                        | Mode | Action        | -->
<!-- | ------------------------------------------ | :--: | ------------- | -->
<!-- | <kbd>Space</kbd>+<kbd>m</kbd>+<kbd>f</kbd> |  𝐍   | Build File    | -->
<!-- | <kbd>Space</kbd>+<kbd>m</kbd>+<kbd>p</kbd> |  𝐍   | Build Project | -->
<!-- | <kbd>Space</kbd>+<kbd>m</kbd>+<kbd>e</kbd> |  𝐍   | Edit Tasks    | -->
<!-- | <kbd>Space</kbd>+<kbd>m</kbd>+<kbd>l</kbd> |  𝐍   | List Tasks    | -->
<!-- | <kbd>Space</kbd>+<kbd>r</kbd>+<kbd>f</kbd> |  𝐍   | Run File      | -->
<!-- | <kbd>Space</kbd>+<kbd>r</kbd>+<kbd>p</kbd> |  𝐍   | Run Project   | -->
<!---->


### Plugin: Gitsigns


| Key                                                                                      | Mode | Action                 |
| ---------------------------------------------------------------------------------------- | :--: | ---------------------- |
| <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>p</kbd>                                               |  𝐍   | Preview hunk           |
| <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>l</kbd>                                               |  𝐍   | Blame line             |
| <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>s</kbd>                                               | 𝐍 𝐕  | Stage hunk             |
| <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>u</kbd>                                               |  𝐍   | Undo stage hunk        |
| <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>r</kbd>                                               | 𝐍 𝐕  | Reset hunk             |
| <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>S</kbd>                                               | 𝐍 𝐕  | Stage Buffer           |
| <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>R</kbd>                                               | 𝐍 𝐕  | Reset Buffer           |
| <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>d</kbd>                                               | 𝐍 𝐕  | Diff this              |
| <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>t</kbd>                                               | 𝐍 𝐕  | Toggle Delted          |
<!-- | <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>D</kbd>                                               | 𝐍 𝐕  | Diff This              | -->
<!-- | <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>j</kbd> or <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>k</kbd> |  𝐍   | Next/previous Git hunk | -->
<!-- | <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>l</kbd>                                               |  𝐍   | Toggle Blame line      | -->


Remaning: -- Text object -- map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')



### Plugin: LazyGit

| Key                                        | Mode | Action           |
| ------------------------------------------ | :--: | ---------------- |
| <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>g</kbd> |  𝐍   | Open lazy git UI |



### Plugin: Telescope

| Key                                        | Mode | Action                     |
| ------------------------------------------ | :--: | -------------------------- |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>p</kbd> |  𝐍   | Project search             |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>P</kbd> |  𝐍   | Project files search       |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>g</kbd> |  𝐍   | Grep search                |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>f</kbd> |  𝐍   | Telescope find_files       |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>e</kbd> |  𝐍   | Telescope file_browser     |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>b</kbd> |  𝐍   | Buffers                    |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>c</kbd> |  𝐍   | Colorschemes               |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>h</kbd> |  𝐍   | Find help                  |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>k</kbd> |  𝐍   | Keymap search              |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>M</kbd> |  𝐍   | Man Pages search           |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>r</kbd> |  𝐍   | Register search            |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>T</kbd> |  𝐕   | Grep string under cursor   |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>t</kbd> |  𝐍   | Grep raw                   |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>S</kbd> |  𝐍   | Current buffer search      |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>G</kbd> |  𝐍   | Git files search           |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>K</kbd> |  𝐍   | Command pallete            |
| <kbd>Space</kbd>+<kbd>s</kbd>+<kbd>t</kbd> |  𝐍   | TODOS  search              |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>B</kbd> |  𝐍   | Browser bookmarks search   |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>n</kbd> |  𝐍   | Notification History       |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>l</kbd> |  𝐍   | Last Picker                |
<!-- | <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>i</kbd> |  𝐍   | Installed plugins          | -->
<!-- | <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>s</kbd> |  𝐍   | Builtin search             | -->
<!-- | <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>C</kbd> |  𝐍   | Command history            | -->
<!-- | <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>l</kbd> |  𝐍   | Reopen last search         | -->



| **in _Telescope_ window**                  |      |                            |
| <kbd>CR</kbd>                              | 𝐈 𝐍  | Multi/Single Open          |
| <kbd>Ctrl</kbd>+<kbd>c</kbd>  <kbd>q</kbd> | 𝐈 𝐍  | Exit telescope             |
| <kbd>Ctrl</kbd>+<kbd>v</kbd>               | 𝐈 𝐍  | Open in a vertical split   |
| <kbd>Ctrl</kbd>+<kbd>s</kbd>               | 𝐈 𝐍  | Open in a split            |
| <kbd>Ctrl</kbd>+<kbd>t</kbd>               | 𝐈 𝐍  | Open in a tab              |
| <kbd>Ctrl</kbd>+<kbd>b</kbd>               |  𝐈   | Go back in Command Palette |
| <kbd>Tab</kbd>                             | 𝐈 𝐍  | Toggle Selection + Next    |
| <kbd>Shift</kbd>+<kbd>Tab</kbd>            | 𝐈 𝐍  | Toggle Selection + Prev    |
<!---->
<!-- ### Plugin: Harpoon -->
<!---->
<!-- | Key                               | Mode | Action                           | -->
<!-- | --------------------------------- | :--: | -------------------------------- | -->
<!-- | <kbd>Space</kbd>+<kbd>Space</kbd> |  𝐍   | show harpoon shortlist           | -->
<!-- | <kbd>Space</kbd>+<kbd>a</kbd>     |  𝐍   | add file to shortlist            | -->
<!-- | <kbd>Space</kbd>+<kbd>1</kbd>     |  𝐍   | jump to first file on shortlist  | -->
<!-- | <kbd>Space</kbd>+<kbd>2</kbd>     |  𝐍   | jump to second file on shortlist | -->
<!-- | <kbd>Space</kbd>+<kbd>3</kbd>     |  𝐍   | jump to third file on shortlist  | -->
<!-- | <kbd>Space</kbd>+<kbd>4</kbd>     |  𝐍   | jump to forth file on shortlist  | -->
<!---->
<!-- ### Plugin: Neogen -->
<!---->
<!-- | Key                                        | Mode | Action                 | -->
<!-- | ------------------------------------------ | :--: | ---------------------- | -->
<!-- | <kbd>Space</kbd>+<kbd>n</kbd>+<kbd>c</kbd> |  𝐍   | Class documentation    | -->
<!-- | <kbd>Space</kbd>+<kbd>n</kbd>+<kbd>f</kbd> |  𝐍   | Function documentation | -->
<!-- | <kbd>Space</kbd>+<kbd>n</kbd>+<kbd>t</kbd> |  𝐍   | Type documentation     | -->
<!-- | <kbd>Space</kbd>+<kbd>n</kbd>+<kbd>F</kbd> |  𝐍   | File documentation     | -->
<!---->
<!-- ### Plugin: Persistence -->
<!---->
<!-- | Key                                        | Mode | Action                                | -->
<!-- | ------------------------------------------ | :--: | ------------------------------------- | -->
<!-- | <kbd>Space</kbd>+<kbd>q</kbd>+<kbd>d</kbd> |  𝐍   | quit without saving session           | -->
<!-- | <kbd>Space</kbd>+<kbd>q</kbd>+<kbd>l</kbd> |  𝐍   | restore last session                  | -->
<!-- | <kbd>Space</kbd>+<kbd>q</kbd>+<kbd>s</kbd> |  𝐍   | restore last session from current dir | -->

### Plugin: Bufferline

| Key                                        | Mode | Action               |
| ------------------------------------------ | :--: | -------------------- |
| <kbd>Shift</kbd>+<kbd>x/q</kbd>            |  𝐍   | close buffer         |
| <kbd>Shift</kbd>+<kbd>l</kbd>              |  𝐍   | buffer cycle next    |
| <kbd>Shift</kbd>+<kbd>h</kbd>              |  𝐍   | buffer cycle prev    |
<!-- | <kbd>Space</kbd>+<kbd>b</kbd>+<kbd>f</kbd> |  𝐍   | find buffer          | -->
<!-- | <kbd>Space</kbd>+<kbd>b</kbd>+<kbd>b</kbd> |  𝐍   | toggle buffer groups | -->
<!-- | <kbd>Space</kbd>+<kbd>b</kbd>+<kbd>p</kbd> |  𝐍   | toggle pin           | -->
<!-- | <kbd>Space</kbd>+<kbd>b</kbd>+<kbd>s</kbd> |  𝐍   | pick buffer          | -->
<!-- | <kbd>Space</kbd>+<kbd>b</kbd>+<kbd>1</kbd> |  𝐍   | goto buffer 1        | -->
<!-- | <kbd>Space</kbd>+<kbd>b</kbd>+<kbd>h</kbd> |  𝐍   | Close all to left    | -->
<!-- | <kbd>Space</kbd>+<kbd>b</kbd>+<kbd>l</kbd> |  𝐍   | Close all to right   | -->
<!-- | <kbd>Space</kbd>+<kbd>b</kbd>+<kbd>D</kbd> |  𝐍   | Sort by directory    | -->
<!-- | <kbd>Space</kbd>+<kbd>b</kbd>+<kbd>L</kbd> |  𝐍   | Sort by language     | -->


### Plugin: Trouble

| Key                                        | Mode | Action                |
| ------------------------------------------ | :--: | --------------------- |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>D</kbd> |  𝐍   | diagnostics           |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>d</kbd> |  𝐍   | definitions           |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>r</kbd> |  𝐍   | references            |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>t</kbd> |  𝐍   | todo                  |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>w</kbd> |  𝐍   | workspace diagnostics |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>q</kbd> |  𝐍   | quick-fixes           |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>l</kbd> |  𝐍   | local list            |

<!---->
<!-- ### Plugin: Ultest -->
<!---->
<!-- | Key                                        | Mode | Action                  | -->
<!-- | ------------------------------------------ | :--: | ----------------------- | -->
<!-- | <kbd>Space</kbd>+<kbd>T</kbd>+<kbd>f</kbd> |  𝐍   | run all tests in a file | -->
<!-- | <kbd>Space</kbd>+<kbd>T</kbd>+<kbd>n</kbd> |  𝐍   | only run nearest test   | -->
<!-- | <kbd>Space</kbd>+<kbd>T</kbd>+<kbd>s</kbd> |  𝐍   | open test summary       | -->
<!---->
<!-- ### Plugin: Spectre -->
<!---->
<!-- | Key                                        | Mode | Action                         | -->
<!-- | ------------------------------------------ | :--: | ------------------------------ | -->
<!-- | <kbd>Space</kbd>+<kbd>R</kbd>+<kbd>p</kbd> |  𝐍   | replace word in project        | -->
<!-- | <kbd>Space</kbd>+<kbd>R</kbd>+<kbd>w</kbd> |  𝐍   | replace visually selected word | -->
<!-- | <kbd>Space</kbd>+<kbd>R</kbd>+<kbd>f</kbd> |  𝐍   | replace word in current buffer | -->
<!---->
<!-- ### Plugin: Copilot -->
<!---->
<!-- | Key                          | Mode | Action                              | -->
<!-- | ---------------------------- | :--: | ----------------------------------- | -->
<!-- | <kbd>Ctrl</kbd>+<kbd>h</kbd> |  𝐈   | `copilot#Accept("<CR>")`            | -->
<!-- | <kbd>Ctrl</kbd>+<kbd>e</kbd> |  𝐈   | close cmp menu                      | -->
<!-- | <kbd>Ctrl</kbd>+<kbd>]</kbd> |  𝐈   | `<Plug>(copilot-dismiss)`           | -->
<!-- | <kbd>Alt</kbd>+<kbd>]</kbd>  |  𝐈   | `<Plug>(copilot-next)`              | -->
<!-- | <kbd>Alt</kbd>+<kbd>[</kbd>  |  𝐈   | `<Plug>(copilot-previous)`          | -->
<!-- | <kbd>Alt</kbd>+<kbd>\</kbd>  |  𝐈   | `"<Cmd>vertical Copilot panel<CR>"` | -->
<!---->
</details



### Plugins
[Packer](https://github.com/packer.nvim)
Alpha : This Plugins is Used for Dashboard in Neovim.
Nvim_Autopairs : Simple Plugins for using Autopair feature.
Comment Nvim: This is a plugin for making commenting easier.
Cinnamon Nvim: It is a plugins which helps with smooth scrolling.
cmp, cmp-npm, cmp-lua, cmp-lsp: Completetion Management.
Colorizer: Use to Colorize in terminal.
dap, dap-ui, dap-virtual-text- dap-install, dap-telescope: Debugging Tools.
package-info: Give package.json info and can add change package dependncy from json only.
todo-comments: Todo comment highlight and quick serach
term-toggle: Terminal inside nvim.
nvim-tree: File explorer.
nvim-gps : Indicator of project in statusbar.
nvim-lualine: Statusbar.
trouble: A quick to use diagonsticlist plugin.
treesitter: Highlight layer for languages.
project: Quick project switcher.
git-signs: A git-hepler tool.
luasnip, friendly snippets: Snippet engine and collection.
filetype:
ts-autotag: Autocolose tags for htmls
renamer: Goodlooking renaming tool.
modes: highlight the slected line with color according to mode.
lsp-status: Shows lsp status in statusbar.










### Fixes:
check individual installed plugins and keybinds related to them
find and make more easy configs for beautiful ui colors and icons
learn about lsp and more settings
remove unused plugins and see other plygins that is or need to get installed

dab-telescope fix,
todo-comments accessible from telescope,
term-toggle: more keybinds and some settings,
lua-line setup a setting to change theme shortcut.
trouble setup with keybinds and best uses.
git-signs: proper keybinds and config needed.
project: need to learn its uescases,
luasnip: need to find more easy way of accessing snippets.
filetype: need to learn more about it.
check if renamer is working like it should and try to get to know that treesitter depreication warning source
lspstatus: check if it working or not.
wilder: check config and minify it


### Up-Coming Features
2. check some of the .vim file from the tj repos
3. add some colorscheme and easy to preview method
4. check for scratchpad plugin like quokka in vsocde
5. order of Completetion lsp,buffer, snippets
