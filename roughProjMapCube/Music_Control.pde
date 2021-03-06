void musicProgression() {
  //basicTopCompletion
  //waterTopCompletion
  //crystalSide2Completion, mushroomSide2Completion, platformSide2Completion, bgSide2Completion
  //secondTopCompletion, secondWaterTopCompletion, secondPlatformSide1Completion, secondBgSide1Completion, secondPlatformSide2Completion, secondBgSide2Completion
  //top
  float basicTopConverted = map(basicTopCompletion, 0, 100, -50, -1);
  float waterTopConverted = map(waterTopCompletion, 0, 100, -50, -4);
  //side1
  float platformSide1Converted = map(platformSide1Completion, 0, 100, -50, 5);
  float bgSide1Converted = map(bgSide1Completion, 0, 100, -50, 5);
  float fgSide1Converted = map(fgSide1Completion, 0, 100, -50, -3);
  //side2
  float crystalSide2Converted = map(crystalSide2Completion, 0, 100, -70, 0);
  float mushroomSide2Converted = map(mushroomSide2Completion, 0, 100, -70, 0);
  float bgSide2Converted = map(bgSide2Completion, 0, 100, -70, 0);
  float platformSide2Converted = map(platformSide2Completion, 0, 100, -70, 0);

  //top2
  float secondTopConverted = map(secondTopCompletion, 0, 100, -70, 0);
  float secondWaterTopConverted = map(secondWaterTopCompletion, 0, 100, -70, 0);
  float secondPlatformSide1Converted = map(secondPlatformSide1Completion, 0, 100, -70, 0);
  float secondBgSide1Converted = map(secondBgSide1Completion, 0, 100, -70, 0);
  float secondPlatformSide2Converted = map(secondPlatformSide2Completion, 0, 100, -70, 0);
  float secondBgSide2Converted = map(secondBgSide2Completion, 0, 100, -70, 0);

  pb.setGain(basicTopConverted);
  po.setGain(waterTopConverted);

  px.setGain(platformSide1Converted);
  py.setGain(bgSide1Converted);
  pu.setGain(fgSide1Converted);

  pc.setGain(crystalSide2Converted - 3);
  pd.setGain(crystalSide2Converted - 3);
  pf.setGain(crystalSide2Converted - 3);


  pe.setGain(mushroomSide2Converted - 5);
  pg.setGain(mushroomSide2Converted - 4);
  pn.setGain(mushroomSide2Converted - 3);
  pq.setGain(mushroomSide2Converted - 6);
  pv.setGain(mushroomSide2Converted - 6);
  pz1.setGain(mushroomSide2Converted - 2);

  pg.setGain(bgSide2Converted - 2);
  pj.setGain(bgSide2Converted-3);
  pn.setGain(bgSide2Converted - 4.5);
  pr.setGain(bgSide2Converted - 6);
  pz.setGain(bgSide2Converted - 2);

  pk.setGain(platformSide2Converted - 4);
  pl.setGain(platformSide2Converted - 4);
  pm.setGain(platformSide2Converted - 4);

  pw.setGain(secondTopConverted);
  ps.setGain(secondWaterTopConverted - 13);

  pz2.setGain(secondBgSide1Converted - 5);
  pt.setGain(secondPlatformSide1Converted - 10);

  ph.setGain(secondBgSide2Converted - 5);
    pp.setGain(secondPlatformSide2Converted - 10);
      pu.setGain(secondPlatformSide2Converted - 7);
}

void rewindAll() {
  if (pa.loopCount() > firstLoop && pz2.loopCount() > lastLoop) {
    println("rewinding all");
    firstLoop++;
    lastLoop++;
    thread("rA");
    thread("rB");
    thread("rC");
    thread("rD");
    thread("rE");
    thread("rF");
    thread("rG");
    thread("rH");
    thread("rI");
    thread("rJ");
    thread("rK");
    thread("rL");
    thread("rM");
    thread("rN");
    thread("rO");
    thread("rP");
    thread("rQ");
    thread("rR");
    thread("rS");
    thread("rT");
    thread("rU");
    thread("rV");
    thread("rW");
    thread("rX");
    thread("rY");
    thread("rZ");
    thread("rZ1");
    thread("rZ2");
  }
}

void forceRewind() {
  if (initialRewind == false) {
    pa.rewind(); 
    pb.rewind();
    pc.rewind();
    pd.rewind();
    pe.rewind();
    pf.rewind();
    pg.rewind();
    ph.rewind();
    pi.rewind();
    pj.rewind();
    pk.rewind();
    pl.rewind();
    pm.rewind();
    pn.rewind();
    po.rewind();
    pp.rewind();
    pq.rewind();
    pr.rewind();
    ps.rewind();
    pt.rewind();
    pu.rewind();
    pv.rewind();
    pw.rewind();
    px.rewind();
    py.rewind();
    pz.rewind();
    pz1.rewind();
    pz2.rewind();
    initialRewind = true;
  }
}

void syncSongs() {
  thread("sA");
  thread("sB");
  thread("sC");
  thread("sD");
  thread("sE");
  thread("sF");
  thread("sG");
  thread("sH");
  thread("sI");
  thread("sJ");
  thread("sK");
  thread("sL");
  thread("sM");
  thread("sN");
  thread("sO");
  thread("sP");
  thread("sQ");
  thread("sR");
  thread("sS");
  thread("sT");
  thread("sU");
  thread("sV");
  thread("sW");
  thread("sX");
  thread("sY");
  thread("sZ");
  thread("sZ1");
  thread("sZ2");
}

void startThreads() {
  thread("pA");
  thread("pB");
  thread("pC");
  thread("pD");
  thread("pE");
  thread("pF");
  thread("pG");
  thread("pH");
  thread("pI");
  thread("pJ");
  thread("pK");
  thread("pL");
  thread("pM");
  thread("pN");
  thread("pO");
  thread("pP");
  thread("pQ");
  thread("pR");
  thread("pS");
  thread("pT");
  thread("pU");
  thread("pV");
  thread("pW");
  thread("pX");
  thread("pY");
  thread("pZ");
  thread("pZ1");
  thread("pZ2");
}
