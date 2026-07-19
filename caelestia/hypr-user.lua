-- Monitor positions
-- Left: HP E243m (DP-1)
hl.monitor({
	output = "DP-1",
	mode = "preferred",
	position = "0x0",
	scale = 1,
})

-- Center: HP E243 (DP-2)
hl.monitor({
	output = "DP-2",
	mode = "preferred",
	position = "1920x0",
	scale = 1,
})

-- Right: Laptop screen (eDP-1)
hl.monitor({
	output = "eDP-1",
	mode = "preferred",
	position = "3840x0",
	scale = 1,
})

-- Per-monitor workspace configuration
-- DP-1 (Left): Workspaces 1, 4, 7
hl.workspace_rule({ workspace = "1", monitor = "DP-1", default = true })
hl.workspace_rule({ workspace = "4", monitor = "DP-1" })
hl.workspace_rule({ workspace = "7", monitor = "DP-1" })

-- DP-2 (Center): Workspaces 2, 5, 8
hl.workspace_rule({ workspace = "2", monitor = "DP-2", default = true })
hl.workspace_rule({ workspace = "5", monitor = "DP-2" })
hl.workspace_rule({ workspace = "8", monitor = "DP-2" })

-- eDP-1 (Right): Workspaces 3, 6, 9
hl.workspace_rule({ workspace = "3", monitor = "eDP-1", default = true })
hl.workspace_rule({ workspace = "6", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "9", monitor = "eDP-1" })
