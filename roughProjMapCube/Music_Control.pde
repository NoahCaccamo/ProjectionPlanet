void musicProgression() {
  //basicTopCompletion
  //waterTopCompletion
  float basicTopConverted = map(basicTopCompletion, 0, 100, -50, -1);
  float waterTopConverted = map(waterTopCompletion, 0, 100, -50, -4);
  float platformSide1Converted = map(platformSide1Completion, 0, 100, -50, 10);
  float bgSide1Converted = map(bgSide1Completion, 0, 100, -50, 10);
  float fgSide1Converted = map(fgSide1Completion, 0, 100, -50, -3);
  pb.setGain(basicTopConverted);
  po.setGain(waterTopConverted);
  px.setGain(platformSide1Converted);
  py.setGain(bgSide1Converted);
  pu.setGain(fgSide1Converted);
  
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
  thread("rr");
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
  pa.setGain(0);
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
  thread("sS");
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
