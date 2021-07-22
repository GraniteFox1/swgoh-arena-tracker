FROM iprobedroid/swgoh-arena-tracker:beta-24 as builder

FROM mcr.microsoft.com/dotnet/runtime:5.0
WORKDIR /app
COPY --from=builder /app .
ENTRYPOINT ["dotnet", "SimpleTracker.dll"]

ENV DISCORD_WEB_HOOK=https://discord.com/api/webhooks/866047094108454942/fV-RcgX8rk9bG-fPhpNNjzZWtYCuHoc8SIaszBSE3_XBycZv1bTEz8TpJUx2b280HW8z  \
        ARENA_TYPE=FLEET \
        ALLY_CODES_URL=https://raw.githubusercontent.com/GraniteFox1/swgoh-arena-tracker/master/FA.json \
        DISABLE_STATUS_MESSAGE=FALSE \
        CUSTOM_MESSAGE_STATUS="**[%PLAYER_NAME%](<https://swgoh.gg/p/%ALLY_CODE%>/) is at %CURRENT_RANK% <:crystals:825970086401277983> %TIME_TO_PO%**" \
        CUSTOM_MESSAGE_CLIMB="<:b_up:806635916352946176> **[%PLAYER_NAME%](<https://swgoh.gg/p/%ALLY_CODE%>/) %PREVIOUS_RANK% <:r_up:817234194010341407> %CURRENT_RANK% <:crystals:825970086401277983> %TIME_TO_PO%**" \
        CUSTOM_MESSAGE_DROP="<:b_down:806635945469280276> **[%PLAYER_NAME%](<https://swgoh.gg/p/%ALLY_CODE%>/) %CURRENT_RANK% <:l_down:817234324201275402> %PREVIOUS_RANK% <:crystals:825970086401277983> %TIME_TO_PO% %TAG_ON_DROP%**" \
        TAG_ON_DROP_PO_LIMIT=180 \