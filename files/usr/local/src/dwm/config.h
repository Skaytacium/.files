/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 0;        /* border pixel of windows */
static const unsigned int snap      = 1;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 0;        /* 0 means bottom bar */
static const char *fonts[]          = { "monospace:size=24" };
static const char dmenufont[]       = "monospace:size=24";
static const char col_bg[]       	= "#282828";
static const char col_border[]      = "#fbf1c7";
static const char col_fg[]       	= "#bdae93";
static const char col_sel_bg[]      = "#504945";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_fg, col_bg, col_border },
	[SchemeSel]  = { col_fg, col_sel_bg,  col_sel_bg  },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "7", "8", "9", "0" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	*/
	/* class      instance    title       tags mask     isfloating   monitor */
	/* { "Gimp",     NULL,       NULL,       0,            1,           -1 }, */
	/* { "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 }, */
	{}
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 0; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[M]",      monocle },
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon };
static const char *termcmd[]  = { "kitty", NULL };
const char *screenshot[] = { "ss.sh", NULL };
const char *browser[] = { "chrome", NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_p,      spawn,          	{.v = dmenucmd } },
	{ MODKEY,		                XK_Return, spawn,          	{.v = termcmd } },
	{ MODKEY,                       XK_b,      togglebar,      	{0} },
	{ MODKEY,                       XK_j,      focusstack,     	{.i = -1 } },
	{ MODKEY,                       XK_k,      focusstack,     	{.i = +1 } },
	{ MODKEY,                       XK_Tab,    view,           	{0} },
	{ MODKEY|ShiftMask,             XK_c,      killclient,     	{0} },
	{ MODKEY,                       XK_m,      setlayout,      	{.v = &layouts[0]} },
	{ MODKEY,                       XK_t,      setlayout,      	{.v = &layouts[1]} },
	{ MODKEY,                       XK_f,      setlayout,      	{.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  setlayout,      	{0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, 	{0} },
	{ MODKEY,                       XK_0,      view,           	{.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            	{.ui = ~0 } },
	TAGKEYS(                        XK_1,                      	0)
	TAGKEYS(                        XK_2,                      	1)
	TAGKEYS(                        XK_3,                      	2)
	TAGKEYS(                        XK_4,                      	3)
	TAGKEYS(                        XK_7,                      	4)
	TAGKEYS(                        XK_8,                      	5)
	TAGKEYS(                        XK_9,                      	6)
	TAGKEYS(                        XK_0,                      	7)
	{ MODKEY|ShiftMask,             XK_q,      quit,           	{0} },

	{ MODKEY,			           	XK_i,      setmfact,       	{.f = +0.05} },
	{ MODKEY,  			          	XK_d,	   setmfact,       	{.f = -0.05} },


	{ MODKEY|ShiftMask,             XK_h,      moveidx,     	{.i = -1 } },
	{ MODKEY|ShiftMask,             XK_l,      moveidx,     	{.i = +1 } },
	{ MODKEY,             			XK_h,      viewidx,        	{.i = -1 } },
	{ MODKEY,             			XK_l,      viewidx,        	{.i = +1 } },
 	{ MODKEY|ShiftMask,             XK_k,      movestack,      	{.i = +1 } },
 	{ MODKEY|ShiftMask,             XK_j,      movestack,      	{.i = -1 } },
	{ MODKEY|ShiftMask,             XK_s,      spawn,     		{.v = screenshot } },
	{ MODKEY|ShiftMask,				XK_f,      spawn,			{.v = browser } },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[1]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },

	{ ClkClientWin,         MODKEY,         Button4,        focusstack,     {.i = -1} },
	{ ClkClientWin,         MODKEY,         Button5,        focusstack,     {.i = +1} },
	{ ClkWinTitle,         	0,         		Button4,        focusstack,     {.i = -1} },
	{ ClkWinTitle,         	0,         		Button5,        focusstack,     {.i = +1} },
	{ ClkWinTitle,         	MODKEY,    		Button4,        movestack,      {.i = -1} },
	{ ClkWinTitle,         	MODKEY,    		Button5,        movestack,      {.i = +1} },
	{ ClkWinTitle,          0,              Button1,       	clickwin,       {0} },


	{ ClkClientWin,         MODKEY|ShiftMask,         		Button4,        viewidx,     	{.i = -1} },
	{ ClkClientWin,         MODKEY|ShiftMask,         		Button5,        viewidx,     	{.i = +1} },
	{ ClkRootWin,         	MODKEY|ShiftMask,         		Button4,        viewidx,     	{.i = -1} },
	{ ClkRootWin,         	MODKEY|ShiftMask,         		Button5,        viewidx,     	{.i = +1} },
	{ ClkTagBar,         	0,         		Button4,        viewidx,     	{.i = -1} },
	{ ClkTagBar,         	0,         		Button5,        viewidx,     	{.i = +1} },
};

