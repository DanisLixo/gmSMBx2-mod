//Toggle Record
if (keyboard_check_pressed(vk_f2))
{
	demoRecord = !demoRecord;
				
	//Stop Recording & Save
	if (!demoRecord) && (ds_exists(demoRecordList,ds_type_list))
	{
		var _wrapper = ds_map_create();
		ds_map_add_list(_wrapper,"root",demoRecordList);
		var _theLot = json_encode(_wrapper);
		if (file_exists("demo_p1.json")) file_delete("demo_p1.json");
		var _recordFile = file_text_open_write("demo_p1.json");
		file_text_write_string(_recordFile,_theLot);
		file_text_close(_recordFile);
		ds_map_destroy(_wrapper);
	}
}

if (keyboard_check_pressed(vk_f3))
{
	demoRecord = !demoRecord;
				
	//Stop Recording & Save
	if (!demoRecord) && (ds_exists(demoRecordList,ds_type_list))
	{
		var _wrapper = ds_map_create();
		ds_map_add_list(_wrapper,"root",demoRecordList);
		var _theLot = json_encode(_wrapper);
		if (file_exists("demo_p2.json")) file_delete("demo_p2.json");
		var _recordFile = file_text_open_write("demo_p2.json");
		file_text_write_string(_recordFile,_theLot);
		file_text_close(_recordFile);
		ds_map_destroy(_wrapper);
	}
}


//Record each frame
if (demoRecord) && (instance_exists(oMario))
{
	if (!ds_exists(demoRecordList, ds_type_list)) 
	{
		demoRecordFrames = 1;
		demoRecordList = ds_list_create()
	}
	{
		//Record this frame
		var _frameToRecord = ds_map_create();
		with (oMario) 
		{
			_frameToRecord[? "kr"] = kr;
			_frameToRecord[? "kl"] = kl;
			_frameToRecord[? "kd"] = kd;
			_frameToRecord[? "ku"] = ku;
			
			_frameToRecord[? "krp"] = krp;
			_frameToRecord[? "klp"] = klp;
			_frameToRecord[? "kdp"] = kdp;
			_frameToRecord[? "kup"] = kup;
			
			_frameToRecord[? "kj"] = kj;
			_frameToRecord[? "ka"] = ka;
			
			_frameToRecord[? "kjp"] = kjp;
			_frameToRecord[? "kap"] = kap;
			
			_frameToRecord[? "kar"] = kar;
		}
		ds_list_add(demoRecordList,_frameToRecord);
		ds_list_mark_as_map(demoRecordList,ds_list_size(demoRecordList)-1);
		demoRecordFrames++;
	}
}
