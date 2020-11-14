<h1 align="center">
<img src="./OMGWDYD-logo.png" alt="OMGWDYD logo with suprised emoji" />
</h1>

<p align="center">
  <strong>A CLI tool to motivate (or shame) you</strong>
</p>

<div align="center">
  <img src="https://github.com/timmybytes/OMGWDYD/workflows/CI%20-%20ShellCheck/badge.svg" alt="CI - ShellCheck badge" />
</div>

<div align="center">
  <sub>Built with ❤︎ by
  <a href="https://timmybytes">Timothy Merritt</a>
</div>

<br />

**OMGWDYD** (Oh My God, What Did You Do?!) is a command-line tool to help track the previous day's productivity to provide motivation. Currently, it loops through a main projects folder, checks any git repos inside for commits made since the previous day, and prints them all to stdout in a concise format.

# Usage

_Currently WIP_

<div align="center">
  <img src="https://raw.githubusercontent.com/timmybytes/OMGWDYD/main/OMGWDYD.png" alt="screenshot of OMGWDYD program displaying git repo results" width="420px" height="auto" />
</div>

Download the [`what_you_did.sh`](./what_you_did.sh) file.

Change the `for dir in ~/Projects/\#Repos/*` in the `what_you_did.sh` file to whatever parent directory of repositories you want to check.

Then from a Mac/Linux terminal, run the following to make the script executable:

```sh
chmod +x what_you_did.sh
```

Then to run the script, just type:

```sh
./what_you_did.sh
```

## Features - To Do!

- [x] Get previous day's git commits from all repos
- [ ] Pair with gitcheck for repo health check
- [ ] Get previous day's tweet containing “#100DaysOfCode”
- [ ] Get Wakatime stats from previous day
- [x] Display stats concisely in terminal
- [ ] Automate script to run each morning
- [ ] Output to PDF/HTML and email results?
