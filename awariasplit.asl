state("Awaria") {
    int levelt : "UnityPlayer.dll",0x019F6E90,0x30,0xD0,0x8,0x390,0xE80;
}

startup {
	print("--Starting up!--");
    refreshRate=1;
    settings.Add("chapter1", true, "Chapter1");
    settings.Add("chapter2", true, "Chapter2");
    settings.Add("chapter3", true, "Chapter3");
    settings.Add("chapter4", true, "Chapter4");
    settings.Add("chapter5", true, "Chapter5");
    settings.Add("chapter6", true, "Chapter6");
    settings.Add("chapter7", true, "Chapter7");
    settings.Add("chapter8", true, "Chapter8");
    settings.Add("chapter9", true, "Chapter9");
    settings.Add("chapter10", true, "Chapter10");
    settings.Add("chapter11", true, "Chapter11");
    settings.Add("chapter12", true, "Chapter12");
    settings.Add("chapter13", true, "Chapter13");


}

init {

    vars.previouslevel = new int() ;
    vars.currentlevel = new int() ;
   

    print("tmp test : " + current.levelt);

    vars.chapter_track = new int[13];
    for (int i = 0; i < 13; i++){
        // print("value : " + i);
        // print(settings["chapter"+(i+1).ToString()].ToString());
        if( settings["chapter"+(i+1).ToString()] == false ) {
            vars.chapter_track[i]=0;
            // print("true");
        }
        else {
            vars.chapter_track[i]=1;
            // print("false");
        }
        print("chapter : " + (i+1).ToString() + " value : " + vars.chapter_track[i].ToString());


    }



}

//splits detecte 0->1->0 
split {
    //vars.previouslevel = vars.currentlevel;
    // vars.currentlevel = current.levelt;
    // if previous value = 1 & new value = 0 : mark split
    if (vars.currentlevel != vars.previouslevel  && vars.chapter_track[vars.previouslevel]==1 ){
        vars.chapter_track[vars.previouslevel]=0;
        return true;

    }

}
update {

    print("tmp test : " + current.levelt);
    vars.previouslevel = vars.currentlevel;
    vars.currentlevel = current.levelt;
   
}

