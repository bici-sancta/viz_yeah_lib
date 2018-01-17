

/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
/*
 * ...  MSDS 6390 - Data Visualization
 * ...
 * ...  utility function : streamlines_btwn_2_horiz_curves()
 * ...    - fill space between 2 horizontal curves with stream lines
 * ...
 * ...  inputs :
 *...    - float[] x_i, float[] y_i : x-y coordinates of lower bounding curve
 * ...   - float[] x_s, float[] y_s : x-y coordinates of upper bounding curve
 * ...      this has been used for array lenghts of array size is approx
 * ...      1/3 of image width, e.g., array length of 200+ points for image
 * ...      width of 600 pixels. I do not know what happens if array is sparsely
 * ...      fills width space.
 * ...      I used a mapping function to interpolate between a crudely drawn curve to
 * ...      create a finely mapped curve.
 * ...   - int n_stream_lines : number of stream lines to draw
 
 * ...   - float ligne_pct_min, float ligne_pct_max : lenght of stream lines
 * ...          in percent image width, e.g.,
 * ...          ligne_pct_min = 5 and ligne_pct_max = 10 will produce stream
 * ...          lines that are random variation of length between 5% and 10%
 * ...          of image width
 
 * ...   - int rge, int vrt, int ble : baseline RGB colors 
 
 * ...   - int color_variation : percent of variation about RGB colors, e.g.,
 * ...          color_variation = 20 will produce RGB colors with random(-20, 20)
 * ...          variation (independently) for each color for each stream line
 
 * ...   - int stroke_wgt_min, int stroke_wgt_max : max and min stroke widths, stroke
 * ...          width is randomly varied from (min, max) width for each line
 * ...
 * ...  return arguments :
 * ...    none
 * ...
 * ...  last revised : 16-jan-2018
 * ...
 * ...  pmcdevitt@smu.edu                                              */
/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */ 



void setup()
{
  size(850, 670);
  noLoop();  // Run once and stop
}

/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
/* draw() routine
/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

void draw()
{
  
  background(50, 50, 75);
  
/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
/* horizon - supérieur                                                 */
/* - draws the upper horizon
/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
 
float x_hz[] = {-0.20, 0.000, 0.028, 0.060, 0.092, 0.136, 0.252, 0.324, 0.400, 0.453, 0.494, 0.543, 0.606, 0.656, 0.705, 0.776, 0.825, 0.878, 0.938, 0.992, 1.20};
float y_hz[] = { 0.40, 0.411, 0.423, 0.434, 0.411, 0.383, 0.373, 0.383, 0.411, 0.423, 0.434, 0.429, 0.457, 0.473, 0.457, 0.501, 0.559, 0.591, 0.620, 0.637, 0.650};

float x_hzs_plt[] = {-0.20, 0.000, 0.028, 0.060, 0.092, 0.136, 0.252, 0.324, 0.400, 0.453, 0.494, 0.543, 0.606, 0.656, 0.705, 0.776, 0.825, 0.878, 0.938, 0.992, 1.20};
float y_hzs_plt[] = { 0.40, 0.411, 0.423, 0.434, 0.411, 0.383, 0.373, 0.383, 0.411, 0.423, 0.434, 0.429, 0.457, 0.473, 0.457, 0.501, 0.559, 0.591, 0.620, 0.637, 0.650};

  for (int i_hz = 0; i_hz < x_hz.length; i_hz++)
  {
    x_hzs_plt[i_hz] = x_hz[i_hz] * width;
    y_hzs_plt[i_hz] = (1- y_hz[i_hz]) * height;
  }

  stroke(0);
  noFill();
  strokeWeight(3);
  beginShape();
    curveVertex(x_hzs_plt[0], y_hzs_plt[0]);
    for (int j_hz = 0; j_hz < x_hzs_plt.length; j_hz++)
    {
      curveVertex(x_hzs_plt[j_hz], y_hzs_plt[j_hz]);
    }
    curveVertex(x_hzs_plt[x_hzs_plt.length-1], y_hzs_plt[x_hzs_plt.length-1]);
  endShape();

/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
/* horizon - inferieur    */
/* - draws the lower horizon line 
/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
 
float x_hzi[] = {-0.20, 0.000, 0.058, 0.125, 0.227, 0.364, 0.409, 0.450, 0.489, 0.534, 0.580, 0.623, 0.670, 0.705, 0.750, 0.809, 0.852, 0.870, 0.875, 0.909, 0.943, 0.989, 1.200};
float y_hzi[] = { 0.29, 0.294, 0.271, 0.286, 0.271, 0.286, 0.314, 0.323, 0.300, 0.323, 0.357, 0.377, 0.386, 0.371, 0.386, 0.400, 0.414, 0.420, 0.443, 0.457, 0.500, 0.500, 0.500};

float x_hzi_plt[] = {-0.20, 0.000, 0.058, 0.125, 0.227, 0.364, 0.409, 0.450, 0.489, 0.534, 0.580, 0.623, 0.670, 0.705, 0.750, 0.809, 0.852, 0.870, 0.875, 0.909, 0.943, 0.989, 1.200};
float y_hzi_plt[] = { 0.29, 0.294, 0.271, 0.286, 0.271, 0.286, 0.314, 0.323, 0.300, 0.323, 0.357, 0.377, 0.386, 0.371, 0.386, 0.400, 0.414, 0.420, 0.443, 0.457, 0.500, 0.500, 0.500};

  for (int i_hzi = 0; i_hzi < x_hzi.length; i_hzi++)
  {
    x_hzi_plt[i_hzi] = x_hzi[i_hzi] * width;
    y_hzi_plt[i_hzi] = (1- y_hzi[i_hzi]) * height;
  }
  
  stroke(0);
  noFill();
  strokeWeight(3);
  beginShape();
    curveVertex(x_hzi_plt[0], y_hzi_plt[0]);
    for (int j_hzi = 0; j_hzi < x_hzi_plt.length; j_hzi++)
    {
      curveVertex(x_hzi_plt[j_hzi], y_hzi_plt[j_hzi]);
    }
    curveVertex(x_hzi_plt[x_hzi_plt.length-1], y_hzi_plt[x_hzi_plt.length-1]);
  endShape();

/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
/* map points to higher fidelity    */
/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
  
  float [] xi_pts = new float[250];
  float [] yi_pts = new float[250];
    
  float [] xs_pts = new float[250];
  float [] ys_pts = new float[250];
  
  map_points_on_curve (x_hzi_plt, y_hzi_plt, 10, xi_pts, yi_pts);
  map_points_on_curve (x_hzs_plt, y_hzs_plt, 10, xs_pts, ys_pts);

/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
/* draw streamlines - 1st blue, then yellow-ish   */
/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
    int rge_hz = 50;
    int vrt_hz = 125;
    int ble_hz = 225;

    streamlines_btwn_2_horiz_curves (xi_pts, yi_pts, xs_pts, ys_pts,
                    200, 2.5, 3.5,
                    rge_hz, vrt_hz, ble_hz, 30, 1, 4);

    int rge_hz2 = 200;
    int vrt_hz2 = 210;
    int ble_hz2 = 160;

    streamlines_btwn_2_horiz_curves (xi_pts, yi_pts, xs_pts, ys_pts,
                    50, 1.0, 2.0,
                    rge_hz2, vrt_hz2, ble_hz2, 30, 1, 3);

}

/* ... -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-  */
/* ...  fill between 2 curves with varying streamlines                                        */
/* ... -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-  */

void streamlines_btwn_2_horiz_curves(float[] x_i, float[] y_i, float[] x_s, float[] y_s,
                    int n_stream_lines, float ligne_pct_min, float ligne_pct_max,
                    int rge, int vrt, int ble, int color_variation,
                    int stroke_wgt_min, int stroke_wgt_max)
{
  
  float[] x_rndm = new float[4];
  float[] y_rndm = new float[4];
  
  noFill();

    float x_srch_min = min(min(x_i), min(x_s));
    float x_srch_max = max(max(x_i), max(x_s));
    
    float x_length_min = ligne_pct_min / 100;
    float x_length_max = ligne_pct_max / 100;
    
    for (int i_stream = 0; i_stream < n_stream_lines; i_stream++)
    {
        int ipt = 0;
        x_rndm[ipt] = random(x_srch_min, x_srch_max);
        
        int i_srch = 0;
        while (i_srch < x_i.length-1 && x_i[i_srch] < x_rndm[ipt]) { i_srch++; }
        
        int j_srch = 0;
        while (j_srch < x_s.length-1 && x_s[j_srch] < x_rndm[ipt]) { j_srch++; }

        float y_min = min(y_s[j_srch], y_i[i_srch]);
        float y_max = max(y_s[j_srch], y_i[i_srch]);
  
        y_rndm[ipt] = random(y_min, y_max);
  
        float y_ratio = (y_rndm[ipt] - y_min) / (y_max - y_min);
        
        for (ipt = 1; ipt < 4; ipt++)
        {
          int sign = signum(y_s[j_srch] - y_i[i_srch]);
        
          x_rndm[ipt] = min(x_rndm[ipt-1] + sign * random (x_length_min, x_length_max) * width, width);
          
          int i2_srch = 0;  
          while (i2_srch < x_i.length-1 && x_i[i2_srch] < x_rndm[ipt]) { i2_srch++; }
        
          int j2_srch = 0;
          while (j2_srch < x_s.length-1 && x_s[j2_srch] < x_rndm[ipt]) { j2_srch++; }
          
          float y_min_2 = min(y_s[j2_srch], y_i[i2_srch]);
          float y_max_2 = max(y_s[j2_srch], y_i[i2_srch]);
          
          y_rndm[ipt] = min(y_min_2 + y_ratio * (y_max_2 - y_min_2), y_max_2);
        }
  
    strokeWeight(random(stroke_wgt_min, stroke_wgt_max));
    
    stroke(rge + random(-color_variation, color_variation),
           vrt + random(-color_variation, color_variation),
           ble + random(-color_variation, color_variation));
           
    if (y_rndm[3] > 0)
    {
      beginShape();
        curveVertex(x_rndm[0], y_rndm[0]); 
        curveVertex(x_rndm[0], y_rndm[0]); 
        curveVertex(x_rndm[1], y_rndm[1]);
        curveVertex(x_rndm[2], y_rndm[2]);
        curveVertex(x_rndm[3], y_rndm[3]);
        curveVertex(x_rndm[3], y_rndm[3]);
      endShape();
    }
  }
}  //<>//

/* ... -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-  */
/* ...  map curve boundary to higher fidelity points arrays                                   */
/* ... -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-  */

void map_points_on_curve (
              float[] x_few_pts, float[] y_few_pts, int n_btwn,
              float[] x_many_pts, float[] y_many_pts)
{
  
  int ipt_cnt = 0;
  
  for (int numi = 0; numi < x_few_pts.length - 1; numi++)
  {      
      for (int it = 0; it < n_btwn; it++)
      {
    
        float tii = float(it) / float(n_btwn);
        
        float xiipt = curvePoint(x_few_pts[numi], x_few_pts[numi], x_few_pts[numi+1], x_few_pts[numi+1], tii);
        float yiipt = curvePoint(y_few_pts[numi], y_few_pts[numi], y_few_pts[numi+1], y_few_pts[numi+1], tii);   
      
        x_many_pts[ipt_cnt] = xiipt;
        y_many_pts[ipt_cnt] = yiipt;

        ipt_cnt++;
      }
  }  
    for (int numj = 0; numj < x_many_pts.length; numj++)
    {
      print (numj, round(x_many_pts[numj]), round(y_many_pts[numj]), "\n");
    }
}


/* ... -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-  */
/* ...  signum function ... https://processing.org/discourse/beta/num_1194348325.html */
/* ... -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-  */


int signum(float f) {
  if (f > 0) return 1;
  if (f < 0) return -1;
  return 0;
} 