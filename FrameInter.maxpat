{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 5,
			"minor" : 1,
			"revision" : 9
		}
,
		"rect" : [ 1009.0, 335.0, 628.0, 308.0 ],
		"bglocked" : 0,
		"defrect" : [ 1009.0, 335.0, 628.0, 308.0 ],
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
					"maxclass" : "inlet",
					"outlettype" : [ "" ],
					"patching_rect" : [ 238.0, 141.0, 25.0, 25.0 ],
					"id" : "obj-19",
					"numinlets" : 0,
					"numoutlets" : 1,
					"comment" : "interpolation factor"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "slider",
					"floatoutput" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 16.0, 99.0, 598.0, 17.0 ],
					"bgcolor" : [ 0.698039, 0.698039, 0.698039, 0.231373 ],
					"id" : "obj-24",
					"size" : 1.0,
					"numinlets" : 1,
					"bordercolor" : [ 0.47451, 0.47451, 0.47451, 0.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "ftm.copy #3",
					"outlettype" : [ "" ],
					"patching_rect" : [ 225.0, 269.0, 73.0, 20.0 ],
					"id" : "obj-16",
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"saved_object_attributes" : 					{
						"ftm_scope" : 1,
						"ftm_objref_conv" : 0
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"outlettype" : [ "float", "bang" ],
					"patching_rect" : [ 225.0, 216.0, 50.0, 20.0 ],
					"id" : "obj-13",
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "ftm.inter",
					"outlettype" : [ "" ],
					"patching_rect" : [ 225.0, 243.0, 154.0, 20.0 ],
					"id" : "obj-11",
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"numinlets" : 3,
					"numoutlets" : 1,
					"saved_object_attributes" : 					{
						"ftm_scope" : 0,
						"ftm_objref_conv" : 0
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadbang",
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 283.0, 135.0, 60.0, 20.0 ],
					"id" : "obj-10",
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"outlettype" : [ "int" ],
					"patching_rect" : [ 283.0, 159.0, 20.0, 20.0 ],
					"id" : "obj-7",
					"numinlets" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "metro 1",
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 283.0, 183.0, 51.0, 20.0 ],
					"id" : "obj-5",
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "ftm.mess",
					"outlettype" : [ "" ],
					"#init" : "",
					"patching_rect" : [ 360.0, 216.0, 22.013672, 18.0 ],
					"id" : "obj-4",
					"fontname" : "Arial",
					"#untuple" : 0,
					"text" : [ "_#2" ],
					"ftm_scope" : 0,
					"fontsize" : 12.0,
					"numinlets" : 2,
					"#loadbang" : 0,
					"presentation_rect" : [ 360.0, 216.0, 22.013672, 18.0 ],
					"ftm_objref_conv" : 0,
					"numoutlets" : 1,
					"#triggerall" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "ftm.mess",
					"outlettype" : [ "" ],
					"#init" : "",
					"patching_rect" : [ 283.0, 216.0, 22.013672, 18.0 ],
					"id" : "obj-3",
					"fontname" : "Arial",
					"#untuple" : 0,
					"text" : [ "_#1" ],
					"ftm_scope" : 0,
					"fontsize" : 12.0,
					"numinlets" : 2,
					"#loadbang" : 0,
					"presentation_rect" : [ 283.0, 216.0, 22.013672, 18.0 ],
					"ftm_objref_conv" : 0,
					"numoutlets" : 1,
					"#triggerall" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "ftm.vecdisplay",
					"minval1" : -1.0,
					"outlettype" : [ "", "", "", "", "", "" ],
					"patching_rect" : [ 414.0, 16.0, 200.0, 100.0 ],
					"bgcolor" : [ 0.94902, 0.94902, 0.94902, 1.0 ],
					"id" : "obj-2",
					"fgcolor1" : [ 0.25098, 0.25098, 0.25098, 1.0 ],
					"ftm_scope" : 0,
					"numinlets" : 5,
					"ftm_objref_conv" : 0,
					"numoutlets" : 6
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "ftm.vecdisplay",
					"minval1" : -1.0,
					"outlettype" : [ "", "", "", "", "", "" ],
					"patching_rect" : [ 215.0, 16.0, 200.0, 100.0 ],
					"bgcolor" : [ 0.94902, 0.94902, 0.94902, 1.0 ],
					"id" : "obj-1",
					"fgcolor1" : [ 0.25098, 0.25098, 0.25098, 1.0 ],
					"ftm_scope" : 0,
					"numinlets" : 5,
					"ftm_objref_conv" : 0,
					"numoutlets" : 6
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "ftm.vecdisplay",
					"minval1" : -1.0,
					"outlettype" : [ "", "", "", "", "", "" ],
					"patching_rect" : [ 16.0, 16.0, 200.0, 100.0 ],
					"bgcolor" : [ 0.94902, 0.94902, 0.94902, 1.0 ],
					"id" : "obj-14",
					"fgcolor1" : [ 0.25098, 0.25098, 0.25098, 1.0 ],
					"ftm_scope" : 2,
					"numinlets" : 5,
					"ftm_objref_conv" : 0,
					"numoutlets" : 6
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-11", 0 ],
					"destination" : [ "obj-16", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-10", 0 ],
					"destination" : [ "obj-7", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 0 ],
					"destination" : [ "obj-11", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-4", 0 ],
					"destination" : [ "obj-11", 2 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-13", 0 ],
					"destination" : [ "obj-11", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 0 ],
					"destination" : [ "obj-14", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-4", 0 ],
					"destination" : [ "obj-1", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-11", 0 ],
					"destination" : [ "obj-2", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-5", 0 ],
					"destination" : [ "obj-13", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-5", 0 ],
					"destination" : [ "obj-4", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-5", 0 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-7", 0 ],
					"destination" : [ "obj-5", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-13", 0 ],
					"destination" : [ "obj-24", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-19", 0 ],
					"destination" : [ "obj-13", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
 ]
	}

}
