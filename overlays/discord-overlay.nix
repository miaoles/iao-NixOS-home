self: super:
{
	discord = super.discord.override {
		nss = self.nss_latest;
	};
}
