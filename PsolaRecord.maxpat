{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 5,
			"minor" : 1,
			"revision" : 9
		}
,
		"rect" : [ 859.0, 44.0, 349.0, 682.0 ],
		"bglocked" : 0,
		"defrect" : [ 859.0, 44.0, 349.0, 682.0 ],
		"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 0,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 0,
		"toolbarvisible" : 1,
		"boxanimatetime" : 200,
		"imprint" : 0,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"boxes" : [ 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "delay 100",
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 139.0, 475.0, 63.0, 20.0 ],
					"id" : "obj-36",
					"fontname" : "Arial",
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "if $f1 < 0.0001 then 0. else $f1",
					"linecount" : 3,
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 222.0, 448.0, 75.0, 48.0 ],
					"id" : "obj-35",
					"fontname" : "Arial",
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "dbtoa",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 222.0, 424.0, 41.0, 20.0 ],
					"id" : "obj-33",
					"fontname" : "Arial",
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0., -100. 100",
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 236.0, 333.0, 78.0, 18.0 ],
					"id" : "obj-31",
					"fontname" : "Arial",
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 222.0, 400.0, 50.0, 20.0 ],
					"id" : "obj-29",
					"fontname" : "Arial",
					"outlettype" : [ "float", "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "-100., 0. 100",
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 222.0, 354.0, 78.0, 18.0 ],
					"id" : "obj-26",
					"fontname" : "Arial",
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "line 0. 1.",
					"fontsize" : 12.0,
					"numinlets" : 3,
					"numoutlets" : 2,
					"patching_rect" : [ 222.0, 376.0, 56.0, 20.0 ],
					"id" : "obj-21",
					"fontname" : "Arial",
					"outlettype" : [ "", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess 1.",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 198.0, 241.0, 75.0, 20.0 ],
					"id" : "obj-16",
					"fontname" : "Arial",
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "ftm.mess",
					"fontsize" : 12.0,
					"#init" : "",
					"presentation_rect" : [ 136.0, 330.0, 54.691406, 18.0 ],
					"numinlets" : 2,
					"text" : [ "_($1 * $2)" ],
					"#untuple" : 0,
					"numoutlets" : 1,
					"patching_rect" : [ 136.0, 330.0, 54.691406, 18.0 ],
					"#loadbang" : 0,
					"id" : "obj-15",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"ftm_objref_conv" : 0,
					"#triggerall" : 0,
					"ftm_scope" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "ftm.mess",
					"fontsize" : 12.0,
					"#init" : "",
					"presentation_rect" : [ 57.0, 330.0, 54.691406, 18.0 ],
					"numinlets" : 2,
					"text" : [ "_($1 * $2)" ],
					"#untuple" : 0,
					"numoutlets" : 1,
					"patching_rect" : [ 57.0, 330.0, 54.691406, 18.0 ],
					"#loadbang" : 0,
					"id" : "obj-14",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"ftm_objref_conv" : 0,
					"#triggerall" : 0,
					"ftm_scope" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"numinlets" : 1,
					"bordercolor" : [ 0.501961, 0.501961, 0.501961, 0.584314 ],
					"checkedcolor" : [ 0.0, 0.0, 0.0, 0.776471 ],
					"numoutlets" : 1,
					"patching_rect" : [ 18.0, 19.0, 20.0, 20.0 ],
					"id" : "obj-9",
					"outlettype" : [ "int" ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"bordercolor" : [ 0.466667, 0.466667, 0.466667, 0.337255 ],
					"numoutlets" : 2,
					"patching_rect" : [ 241.0, 18.0, 90.0, 21.0 ],
					"id" : "obj-5",
					"fontname" : "Tahoma",
					"outlettype" : [ "float", "bang" ],
					"ignoreclick" : 1,
					"triangle" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "outlet",
					"annotation" : "",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 127.0, 641.0, 25.0, 25.0 ],
					"id" : "obj-4",
					"comment" : "play decision"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "outlet",
					"annotation" : "",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 86.0, 584.0, 25.0, 25.0 ],
					"id" : "obj-3",
					"comment" : "buffer length"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "inlet",
					"annotation" : "",
					"numinlets" : 0,
					"numoutlets" : 1,
					"patching_rect" : [ 171.0, 191.0, 25.0, 25.0 ],
					"id" : "obj-2",
					"outlettype" : [ "" ],
					"comment" : "record"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "inlet",
					"annotation" : "",
					"numinlets" : 0,
					"numoutlets" : 1,
					"patching_rect" : [ 85.0, 191.0, 25.0, 25.0 ],
					"id" : "obj-1",
					"outlettype" : [ "" ],
					"comment" : "sound"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "!- 1",
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 127.0, 591.0, 32.5, 20.0 ],
					"id" : "obj-41",
					"fontname" : "Arial",
					"outlettype" : [ "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 127.0, 616.0, 20.0, 20.0 ],
					"id" : "obj-39",
					"outlettype" : [ "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 86.0, 559.0, 104.0, 20.0 ],
					"id" : "obj-30",
					"fontname" : "Arial",
					"outlettype" : [ "float", "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sel 1 0",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 3,
					"patching_rect" : [ 112.0, 426.0, 46.0, 20.0 ],
					"id" : "obj-28",
					"fontname" : "Arial",
					"outlettype" : [ "bang", "bang", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "stop",
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 139.0, 502.0, 33.0, 18.0 ],
					"id" : "obj-25",
					"fontname" : "Arial",
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "start",
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 103.0, 502.0, 34.0, 18.0 ],
					"id" : "obj-24",
					"fontname" : "Arial",
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "ftm.record #1 @clone 0",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 86.0, 534.0, 135.0, 20.0 ],
					"id" : "obj-22",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"saved_object_attributes" : 					{
						"ftm_objref_conv" : 0,
						"ftm_scope" : 0
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "ftm.clone",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 136.0, 353.0, 59.0, 20.0 ],
					"id" : "obj-20",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"saved_object_attributes" : 					{
						"ftm_objref_conv" : 0,
						"ftm_scope" : 0
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "ftm.clone",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 57.0, 353.0, 59.0, 20.0 ],
					"id" : "obj-19",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"saved_object_attributes" : 					{
						"ftm_objref_conv" : 0,
						"ftm_scope" : 0
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "ftm.mess",
					"fontsize" : 12.0,
					"#init" : "",
					"presentation_rect" : [ 136.0, 378.0, 75.398438, 18.0 ],
					"numinlets" : 2,
					"text" : [ "_{$null $1 $2}" ],
					"#untuple" : 0,
					"numoutlets" : 1,
					"patching_rect" : [ 136.0, 378.0, 75.398438, 18.0 ],
					"#loadbang" : 0,
					"id" : "obj-18",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"ftm_objref_conv" : 0,
					"#triggerall" : 0,
					"ftm_scope" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "ftm.mess",
					"fontsize" : 12.0,
					"#init" : "",
					"presentation_rect" : [ 57.0, 378.0, 75.398438, 18.0 ],
					"numinlets" : 2,
					"text" : [ "_{$1 $null $2}" ],
					"#untuple" : 0,
					"numoutlets" : 1,
					"patching_rect" : [ 57.0, 378.0, 75.398438, 18.0 ],
					"#loadbang" : 0,
					"id" : "obj-17",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"ftm_objref_conv" : 0,
					"#triggerall" : 0,
					"ftm_scope" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "ftm.vecdisplay",
					"numinlets" : 5,
					"numoutlets" : 6,
					"patching_rect" : [ 174.0, 15.0, 160.0, 80.0 ],
					"minval1" : -1.0,
					"id" : "obj-13",
					"outlettype" : [ "", "", "", "", "", "" ],
					"ftm_objref_conv" : 0,
					"fgcolor1" : [ 0.25098, 0.25098, 0.25098, 1.0 ],
					"ftm_scope" : 0,
					"bgcolor" : [ 0.94902, 0.94902, 0.94902, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "VuvGate",
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 2,
					"patching_rect" : [ 85.0, 295.0, 57.0, 20.0 ],
					"id" : "obj-12",
					"fontname" : "Arial",
					"outlettype" : [ "", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "ftom 0.",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 102.0, 270.0, 47.0, 20.0 ],
					"id" : "obj-11",
					"fontname" : "Arial",
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "multislider",
					"setstyle" : 3,
					"numinlets" : 1,
					"bordercolor" : [ 0.501961, 0.501961, 0.501961, 1.0 ],
					"numoutlets" : 2,
					"slidercolor" : [ 0.25098, 0.25098, 0.25098, 1.0 ],
					"patching_rect" : [ 15.0, 94.0, 319.0, 78.0 ],
					"id" : "obj-10",
					"outlettype" : [ "", "" ],
					"setminmax" : [ 0.0, 127.0 ],
					"bgcolor" : [ 0.94902, 0.94902, 0.94902, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "gbr.wind= hann",
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 85.0, 244.0, 92.0, 20.0 ],
					"id" : "obj-8",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"saved_object_attributes" : 					{
						"ftm_objref_conv" : 0,
						"ftm_scope" : 0
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "ftm.vecdisplay",
					"numinlets" : 5,
					"numoutlets" : 6,
					"patching_rect" : [ 15.0, 15.0, 160.0, 80.0 ],
					"minval1" : -1.0,
					"id" : "obj-7",
					"outlettype" : [ "", "", "", "", "", "" ],
					"ftm_objref_conv" : 0,
					"fgcolor1" : [ 0.25098, 0.25098, 0.25098, 1.0 ],
					"ftm_scope" : 0,
					"bgcolor" : [ 0.94902, 0.94902, 0.94902, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "gbr.psy~ 60.",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 4,
					"patching_rect" : [ 85.0, 220.0, 76.0, 20.0 ],
					"id" : "obj-6",
					"fontname" : "Arial",
					"outlettype" : [ "", "", "", "" ],
					"saved_object_attributes" : 					{
						"ftm_objref_conv" : 0,
						"ftm_scope" : 2
					}

				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-28", 1 ],
					"destination" : [ "obj-36", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-36", 0 ],
					"destination" : [ "obj-25", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-9", 0 ],
					"destination" : [ "obj-41", 0 ],
					"hidden" : 1,
					"color" : [ 0.686275, 0.686275, 0.686275, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-9", 0 ],
					"destination" : [ "obj-28", 0 ],
					"hidden" : 1,
					"color" : [ 0.686275, 0.686275, 0.686275, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-2", 0 ],
					"destination" : [ "obj-9", 0 ],
					"hidden" : 1,
					"color" : [ 0.686275, 0.686275, 0.686275, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-30", 0 ],
					"destination" : [ "obj-5", 0 ],
					"hidden" : 1,
					"color" : [ 0.686275, 0.686275, 0.686275, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-22", 0 ],
					"destination" : [ "obj-30", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-25", 0 ],
					"destination" : [ "obj-22", 0 ],
					"hidden" : 0,
					"midpoints" : [ 148.5, 527.5, 95.5, 527.5 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-24", 0 ],
					"destination" : [ "obj-22", 0 ],
					"hidden" : 0,
					"midpoints" : [ 112.5, 527.5, 95.5, 527.5 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-18", 0 ],
					"destination" : [ "obj-22", 0 ],
					"hidden" : 0,
					"midpoints" : [ 145.5, 403.0, 95.5, 403.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-17", 0 ],
					"destination" : [ "obj-22", 0 ],
					"hidden" : 0,
					"midpoints" : [ 66.5, 403.0, 95.5, 403.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-39", 0 ],
					"destination" : [ "obj-4", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-30", 0 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-1", 0 ],
					"destination" : [ "obj-6", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-41", 0 ],
					"destination" : [ "obj-39", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-6", 1 ],
					"destination" : [ "obj-12", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-8", 0 ],
					"destination" : [ "obj-12", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 1 ],
					"destination" : [ "obj-13", 0 ],
					"hidden" : 1,
					"color" : [ 0.686275, 0.686275, 0.686275, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 0 ],
					"destination" : [ "obj-7", 0 ],
					"hidden" : 1,
					"color" : [ 0.686275, 0.686275, 0.686275, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-11", 0 ],
					"destination" : [ "obj-10", 0 ],
					"hidden" : 1,
					"color" : [ 0.686275, 0.686275, 0.686275, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-6", 1 ],
					"destination" : [ "obj-11", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-6", 0 ],
					"destination" : [ "obj-8", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-19", 0 ],
					"destination" : [ "obj-17", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-20", 0 ],
					"destination" : [ "obj-18", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-28", 0 ],
					"destination" : [ "obj-24", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-11", 0 ],
					"destination" : [ "obj-17", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-11", 0 ],
					"destination" : [ "obj-18", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-14", 0 ],
					"destination" : [ "obj-19", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-15", 0 ],
					"destination" : [ "obj-20", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 0 ],
					"destination" : [ "obj-14", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 1 ],
					"destination" : [ "obj-15", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-16", 0 ],
					"destination" : [ "obj-15", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-16", 0 ],
					"destination" : [ "obj-14", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-21", 0 ],
					"destination" : [ "obj-29", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-26", 0 ],
					"destination" : [ "obj-21", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-31", 0 ],
					"destination" : [ "obj-21", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-29", 0 ],
					"destination" : [ "obj-33", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-33", 0 ],
					"destination" : [ "obj-35", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-28", 0 ],
					"destination" : [ "obj-26", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-28", 1 ],
					"destination" : [ "obj-31", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-35", 0 ],
					"destination" : [ "obj-14", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-35", 0 ],
					"destination" : [ "obj-15", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
 ]
	}

}
