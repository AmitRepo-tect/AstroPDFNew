package com.ojassoft.astrosagecloud.DO;

public class InPlanetKpCusp 
{
	double lagna;
    double sun;
    double moon;
    double mars;
    double mercury;
    double jupiter;
    double venus;
    double saturn;
    double rahu;
    double ketu;
    double uranus;
    double neptune;
    double pluto;
    double kpCusp1;
    double kpCusp2;
    double kpCusp3;
    double kpCusp4;
    double kpCusp5;
    double kpCusp6;
    double kpCusp7;
    double kpCusp8;
    double kpCusp9;
    double kpCusp10;
    double kpCusp11;
    double kpCusp12;
    
	public double getLagna() {
		return lagna;
	}
	public void setLagna(double lagna) {
		this.lagna = lagna;
	}
	public double getSun() {
		return sun;
	}
	public void setSun(double sun) {
		this.sun = sun;
	}
	public double getMoon() {
		return moon;
	}
	public void setMoon(double moon) {
		this.moon = moon;
	}
	public double getMars() {
		return mars;
	}
	public void setMars(double mars) {
		this.mars = mars;
	}
	public double getMercury() {
		return mercury;
	}
	public void setMercury(double mercury) {
		this.mercury = mercury;
	}
	public double getJupiter() {
		return jupiter;
	}
	public void setJupiter(double jupiter) {
		this.jupiter = jupiter;
	}
	public double getVenus() {
		return venus;
	}
	public void setVenus(double venus) {
		this.venus = venus;
	}
	public double getSaturn() {
		return saturn;
	}
	public void setSaturn(double saturn) {
		this.saturn = saturn;
	}
	public double getRahu() {
		return rahu;
	}
	public void setRahu(double rahu) {
		this.rahu = rahu;
	}
	public double getKetu() {
		return ketu;
	}
	public void setKetu(double ketu) {
		this.ketu = ketu;
	}
	public double getUranus() {
		return uranus;
	}
	public void setUranus(double uranus) {
		this.uranus = uranus;
	}
	public double getNeptune() {
		return neptune;
	}
	public void setNeptune(double neptune) {
		this.neptune = neptune;
	}
	public double getPluto() {
		return pluto;
	}
	public void setPluto(double pluto) {
		this.pluto = pluto;
	}
	public double getKpCusp1() {
		return kpCusp1;
	}
	public void setKpCusp1(double kpCusp1) {
		this.kpCusp1 = kpCusp1;
	}
	public double getKpCusp2() {
		return kpCusp2;
	}
	public void setKpCusp2(double kpCusp2) {
		this.kpCusp2 = kpCusp2;
	}
	public double getKpCusp3() {
		return kpCusp3;
	}
	public void setKpCusp3(double kpCusp3) {
		this.kpCusp3 = kpCusp3;
	}
	public double getKpCusp4() {
		return kpCusp4;
	}
	public void setKpCusp4(double kpCusp4) {
		this.kpCusp4 = kpCusp4;
	}
	public double getKpCusp5() {
		return kpCusp5;
	}
	public void setKpCusp5(double kpCusp5) {
		this.kpCusp5 = kpCusp5;
	}
	public double getKpCusp6() {
		return kpCusp6;
	}
	public void setKpCusp6(double kpCusp6) {
		this.kpCusp6 = kpCusp6;
	}
	public double getKpCusp7() {
		return kpCusp7;
	}
	public void setKpCusp7(double kpCusp7) {
		this.kpCusp7 = kpCusp7;
	}
	public double getKpCusp8() {
		return kpCusp8;
	}
	public void setKpCusp8(double kpCusp8) {
		this.kpCusp8 = kpCusp8;
	}
	public double getKpCusp9() {
		return kpCusp9;
	}
	public void setKpCusp9(double kpCusp9) {
		this.kpCusp9 = kpCusp9;
	}
	public double getKpCusp10() {
		return kpCusp10;
	}
	public void setKpCusp10(double kpCusp10) {
		this.kpCusp10 = kpCusp10;
	}
	public double getKpCusp11() {
		return kpCusp11;
	}
	public void setKpCusp11(double kpCusp11) {
		this.kpCusp11 = kpCusp11;
	}
	public double getKpCusp12() {
		return kpCusp12;
	}
	public void setKpCusp12(double kpCusp12) {
		this.kpCusp12 = kpCusp12;
	}
	
	/**
     * This function return kp cusp array
     *
     * @param plntAndCusp
     * @return double[]
     */
    public double[] getKpCuspArray() {
        double[] kpCuspArray = new double[12];
        kpCuspArray[0] = this.getKpCusp1();
        kpCuspArray[1] = this.getKpCusp2();
        kpCuspArray[2] = this.getKpCusp3();
        kpCuspArray[3] = this.getKpCusp4();
        kpCuspArray[4] = this.getKpCusp5();
        kpCuspArray[5] = this.getKpCusp6();
        kpCuspArray[6] = this.getKpCusp7();
        kpCuspArray[7] = this.getKpCusp8();
        kpCuspArray[8] = this.getKpCusp9();
        kpCuspArray[9] = this.getKpCusp10();
        kpCuspArray[10] = this.getKpCusp11();
        kpCuspArray[11] = this.getKpCusp12();

        return kpCuspArray;
    }

    public double[] getKpPlanetArray() {
        double[] kpPlanetArray = new double[9];
        kpPlanetArray[0] = this.getSun();
        kpPlanetArray[1] = this.getMoon();
        kpPlanetArray[2] = this.getMars();
        kpPlanetArray[3] = this.getMercury();
        kpPlanetArray[4] = this.getJupiter();
        kpPlanetArray[5] = this.getVenus();
        kpPlanetArray[6] = this.getSaturn();
        kpPlanetArray[7] = this.getRahu();
        kpPlanetArray[8] = this.getKetu();

        return kpPlanetArray;
    }
}
