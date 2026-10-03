# requires -version 5.1
$erroractionpreference = 'silentlycontinue'

$cxh = [ordered]@{
    # local account & setup bypasses
    "1"  = @{ cmd = "localonly";                               desc = "win 10 legacy local user bypass";         tag = "local account & bypasses" }
    "2"  = @{ cmd = "setaddlocalonly";                         desc = "win 11 local account bypass screen";      tag = "local account & bypasses" }
    "3"  = @{ cmd = "setaddnewuser";                           desc = "add local user wizard overlay";           tag = "local account & bypasses" }
    "4"  = @{ cmd = "setsqsalocalonly";                        desc = "security questions & recovery config";    tag = "local account & bypasses" }
    "5"  = @{ cmd = "setchangepwd";                            desc = "local password change dialog";            tag = "local account & bypasses" }

    # oobe stages & autopilot (frx)
    "6"  = @{ cmd = "frx/inclusive";                           desc = "base win 11 consumer oobe entry";         tag = "oobe stages & autopilot" }
    "7"  = @{ cmd = "frx/inclusive?start=OobeProvisioningStatus"; desc = "autopilot enrollment status (esp)";    tag = "oobe stages & autopilot" }
    "8"  = @{ cmd = "frx/inclusive?start=OobeAutopilot";       desc = "kick off autopilot deployment stage";     tag = "oobe stages & autopilot" }
    "9"  = @{ cmd = "frx/autopilotreset";                      desc = "trigger full autopilot device wipe";      tag = "oobe stages & autopilot" }
    "10" = @{ cmd = "frx/inclusive?start=OobeNetwork";         desc = "oobe wifi / network connection step";     tag = "oobe stages & autopilot" }
    "11" = @{ cmd = "frx/inclusive?start=OobePrivacy";         desc = "telemetry & data collection toggles";     tag = "oobe stages & autopilot" }
    "12" = @{ cmd = "frx/inclusive?start=OobeHello";           desc = "oobe windows hello setup stage";          tag = "oobe stages & autopilot" }
    "13" = @{ cmd = "frx/inclusive?start=OobeRegion";          desc = "oobe country & region picker";            tag = "oobe stages & autopilot" }
    "14" = @{ cmd = "frx/inclusive?start=OobeKeyboard";        desc = "oobe keyboard layout selector";           tag = "oobe stages & autopilot" }
    "15" = @{ cmd = "frx/aad";                                 desc = "entra id / azure ad domain join oobe";    tag = "oobe stages & autopilot" }
    "16" = @{ cmd = "frx/teamedition";                         desc = "surface hub team edition oobe setup";     tag = "oobe stages & autopilot" }
    "17" = @{ cmd = "frxrdxinclusive";                         desc = "retail demo interactive mode (frx)";      tag = "oobe stages & autopilot" }
    "18" = @{ cmd = "rdxracskuinclusive";                      desc = "retail demo access sku inclusive";        tag = "oobe stages & autopilot" }

    # second-chance oobe & upgrades
    "19" = @{ cmd = "scoobe";                                  desc = "finish setting up pc wizard (scoobe)";    tag = "second-chance oobe" }
    "20" = @{ cmd = "scoobe%ws";                               desc = "scoobe workspace / modern flow";          tag = "second-chance oobe" }
    "21" = @{ cmd = "scoobe/upgrade";                          desc = "post-feature upgrade greeting flow";      tag = "second-chance oobe" }

    # entra id (azure ad) & mdm
    "22" = @{ cmd = "aadpinresetauth";                         desc = "entra id pin reset auth prompt";          tag = "entra id & mdm" }
    "23" = @{ cmd = "aadsspr";                                 desc = "entra id self-service password reset";    tag = "entra id & mdm" }
    "24" = @{ cmd = "aadwebauth";                              desc = "entra id web auth broker";                tag = "entra id & mdm" }
    "25" = @{ cmd = "moset/aadlocal";                          desc = "link local user to entra id";             tag = "entra id & mdm" }
    "26" = @{ cmd = "moset/connecttowork";                     desc = "work/school intune mdm enrollment";       tag = "entra id & mdm" }
    "27" = @{ cmd = "mosetmdmconnecttowork";                   desc = "modern settings mdm connect to work";     tag = "entra id & mdm" }
    "28" = @{ cmd = "mosetmamconnecttowork?mode=mdm&username=%s&servername=%s"; desc = "modern settings mam connect to work"; tag = "entra id & mdm" }

    # msa & consumer auth
    "29" = @{ cmd = "msacflpinreset";                          desc = "change first logon pin reset";            tag = "msa & consumer auth" }
    "30" = @{ cmd = "msacflpinresetsignin";                    desc = "change first logon pin reset sign-in";    tag = "msa & consumer auth" }
    "31" = @{ cmd = "msacxsigninauthonly";                     desc = "standalone msa login screen";             tag = "msa & consumer auth" }
    "32" = @{ cmd = "msacxsigninpinadd";                       desc = "msa pin enrollment wizard";               tag = "msa & consumer auth" }
    "33" = @{ cmd = "msacxsigninpinreset";                     desc = "msa pin reset prompt";                    tag = "msa & consumer auth" }
    "34" = @{ cmd = "msapinenroll";                            desc = "consumer pin enrollment";                 tag = "msa & consumer auth" }
    "35" = @{ cmd = "msapinreset";                             desc = "consumer pin reset auth flow";            tag = "msa & consumer auth" }
    "36" = @{ cmd = "msasspr";                                 desc = "consumer self-service password reset";    tag = "msa & consumer auth" }
    "37" = @{ cmd = "msardx";                                  desc = "retail demo msa prompt";                  tag = "msa & consumer auth" }
    "38" = @{ cmd = "mosetmsa";                                desc = "modern settings ms account link";         tag = "msa & consumer auth" }
    "39" = @{ cmd = "mosetmsalocal";                           desc = "convert local user to ms account";        tag = "msa & consumer auth" }

    # windows hello for intune (nth / ngc)
    "40" = @{ cmd = "nth";                                     desc = "intune hello / ngc provisioning";         tag = "windows hello & ngc" }
    "41" = @{ cmd = "nth/aadrecovery";                         desc = "intune hello azure ad key recovery";      tag = "windows hello & ngc" }
    "42" = @{ cmd = "nthaadngcfixme";                          desc = "ngc pin / biometric remediation wizard";  tag = "windows hello & ngc" }
    "43" = @{ cmd = "nthaadngconly";                           desc = "ngc entra id setup only";                 tag = "windows hello & ngc" }
    "44" = @{ cmd = "nthaadngcreset";                          desc = "reset hello ngc credentials";             tag = "windows hello & ngc" }
    "45" = @{ cmd = "nthaadngcresetdestructive";               desc = "destructive ngc pin reset";               tag = "windows hello & ngc" }
    "46" = @{ cmd = "nthaadngcresetnondestructive";            desc = "non-destructive ngc pin reset";           tag = "windows hello & ngc" }
    "47" = @{ cmd = "nthaadormdm?ngc=enabled";                 desc = "entra id or mdm with ngc enabled";        tag = "windows hello & ngc" }
    "48" = @{ cmd = "nthentngcfixme";                          desc = "enterprise ngc pin remediation";          tag = "windows hello & ngc" }
    "49" = @{ cmd = "nthentngconly";                           desc = "enterprise ngc setup only";               tag = "windows hello & ngc" }
    "50" = @{ cmd = "nthentngcreset";                          desc = "enterprise ngc pin reset";                tag = "windows hello & ngc" }
    "51" = @{ cmd = "nthentngcresetdestructive";               desc = "enterprise destructive ngc reset";        tag = "windows hello & ngc" }
    "52" = @{ cmd = "nthentormdm";                             desc = "enterprise or mdm setup";                 tag = "windows hello & ngc" }
    "53" = @{ cmd = "nthentormdm?ngc=enabled";                 desc = "enterprise or mdm with ngc enabled";      tag = "windows hello & ngc" }
    "54" = @{ cmd = "nthngcupsell";                            desc = "intune hello upsell prompt";              tag = "windows hello & ngc" }
    "55" = @{ cmd = "nthprivacy";                              desc = "intune hello privacy screen";             tag = "windows hello & ngc" }

    # miscellaneous & modern settings
    "56" = @{ cmd = "setphonepairing";                         desc = "phone link pairing screen";               tag = "modern settings & misc" }
    "57" = @{ cmd = "setphonepairing?scenarioId=SwiftKeyCloudClipboard"; desc = "swiftkey cloud clipboard pairing"; tag = "modern settings & misc" }
    "58" = @{ cmd = "tset/addfamily";                          desc = "microsoft family safety user add";        tag = "modern settings & misc" }
    "59" = @{ cmd = "wlt";                                     desc = "windows license terms (wlt)";             tag = "modern settings & misc" }
    "60" = @{ cmd = "wltuc";                                   desc = "windows license terms uc";                tag = "modern settings & misc" }
}

$fullscreen = $false

function get-roast {
    $roasts = @(
        "i love how you prioritize your own creative typing over the literal options on the screen. it shows real independent thinking. :)",
        "it is so refreshing to see someone type whatever they feel like instead of following simple instructions. never change.",
        "you have a very unique approach to basic data entry. we should all aspire to be so unburdened by accuracy.",
        "i appreciate the effort it took to come up with that input. it's completely wrong, but your enthusiasm is duly noted.",
        "your ability to completely ignore the provided options is truly a testament to human resilience. keep going.",
        "that was a very brave attempt at typing a number. i am sure we will get there eventually.",
        "i can see you're experimenting with different keys on your keyboard today. what a fun learning journey for you. :)",
        "it takes a special kind of confidence to look at a numbered list and type something completely unrelated. good for you.",
        "i am simply in awe of how you interpreted 'pick an id' as 'randomly mash the keyboard.' truly out of the box thinking.",
        "don't worry about getting it right on the first try. reading comprehension is a spectrum, and you are doing your absolute best."
    )
    return ($roasts | get-random)
}

while ($true) {
    clear-host
    $proto = if ($fullscreen) { "ms-cxh-full://" } else { "ms-cxh://" }

    write-host "cloud experience host hijacker v2.2" -foregroundcolor magenta
    write-host "active protocol: " -nonewline
    write-host $proto -foregroundcolor yellow
    write-host " (toggle with 'f')`n" -foregroundcolor darkgray

    $currenttag = ""
    foreach ($k in $cxh.keys) {
        $entry = $cxh[$k]
        if ($entry.tag -ne $currenttag) {
            $currenttag = $entry.tag
            write-host "`n [$currenttag]" -foregroundcolor green
        }
        $cmdstr = "($proto$($entry.cmd))"
        write-host ("   [{0,2}] {1,-48} " -f $k, $entry.desc) -nonewline
        write-host $cmdstr -foregroundcolor darkgray
    }

    write-host "`n controls:" -foregroundcolor green
    write-host "  [f]  toggle windowed / fullscreen canvas mode"
    write-host "  [k]  nuke stuck background cxh processes"
    write-host "  [c]  feed custom raw payload"
    write-host "  [q]  quit"
    write-host ""

    $inputval = (read-host "pick an id, an action, or a raw payload").trim()

    # let user leave peaceably
    if ($inputval -eq 'q') {
        write-host "`ni hope the rest of your day is as pleasant as you are. goodbye.`n" -foregroundcolor darkgray
        break
    }

    # flip protocol
    if ($inputval -eq 'f') {
        $fullscreen = -not $fullscreen
        continue
    }

    # cleanup background tasks
    if ($inputval -eq 'k') {
        write-host "`ncleaning up..." -foregroundcolor darkyellow
        $procs = get-process -name "wwahost", "cloudexperiencehostbroker", "systemsettingsadminflows" -erroraction silentlycontinue
        
        if ($procs) {
            $procs | stop-process -force -erroraction silentlycontinue
            write-host " [+] quietly handled $($procs.count) background tasks for you." -foregroundcolor green
        } else {
            write-host " [-] nothing to clear. you're doing great." -foregroundcolor cyan
        }
        start-sleep -seconds 2
        continue
    }

    $target = $null

    if ($inputval -eq 'c') {
        $custom = read-host "enter custom payload (e.g. frx/inclusive?start=OobeRegion)"
        if ([string]::isnullorwhitespace($custom)) {
            write-host "`na blank payload. profound. take a deep breath and try again." -foregroundcolor red
            start-sleep -seconds 2
            continue
        }
        $target = $custom.trim()
    } elseif ($cxh.keys -contains $inputval) {
        # this actually works for ordered dictionaries unlike my previous "fix"
        $target = $cxh[$inputval].cmd
    } elseif ($inputval -match '^[a-zA-Z0-9_\-\/\?\=\%]+$' -and $inputval -notmatch '^\d+$') {
        $target = $inputval
    } else {
        write-host "`n[!] $(get-roast)" -foregroundcolor red
        start-sleep -seconds 4
        continue
    }

    if ($target) {
        # strip protocol just in case it was pasted
        $cleantarget = $target -replace '(?i)^ms-cxh(-full)?:\/\/', ''
        $finaluri = "$proto$cleantarget"

        write-host "`n[>] launching $finaluri..." -foregroundcolor green

        if ($cleantarget -match "localonly") {
            write-host " [?] just a gentle heads-up: microsoft politely discontinued this in recent builds. if nothing happens, it's not you, it's satya nadella's vision for a connected future. :)" -foregroundcolor darkyellow
        }

        try {
            start-process $finaluri -erroraction stop
            write-host " [+] payload delivered. if it hangs, just press 'k' when you get back to clear it out." -foregroundcolor cyan
        } catch {
            write-host " [-] windows gently declined your request: $_" -foregroundcolor red
        }

        write-host "`npress enter when you're ready to continue..." -foregroundcolor darkgray
        [void][console]::readline()
    }
}