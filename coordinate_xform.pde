/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
/*
 * ...  MSDS 6390 - Data Visualization
 * ...
 * ...  utility function :
 * ...    - transform coordinates from percent screen to image coordinates
 * ...
 * ...  input :
 *...    - float[] x_pct, float[]y_pct
 * ...    - coordinates in perentage of screen width (x) and height (y)
 * ...    - x = 0 is left edge of image; x = 1 is right edge of image
 * ...    - y = 0 is bottom edge; y = 1 is top edge (this is opposite of processing's
 * ...      standard of y increasing from top edge; this is accounted for in transformation
 * ...
 * ...  return arguments :
 * ...    float[]x_img, float[] y_img
 * ...
 * ...  last revised : 16-jan-2018
 * ...
 * ...  pmcdevitt@smu.edu                                              */
/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */ 

/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
/* transfrom coordinates from percent screen to image coordinates
/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

void coordinate_xform(float[] x_pct, float[] y_pct, float[] x_img, float[] y_img)
{
  int n_points = min(x_pct.length, y_pct.length);
  
  for (int i = 0; i < n_points; i++)
  {
    x_img[i] = x_pct[i] * width;
    y_img[i] = (1- y_pct[i]) * height;
  }
}  //<>//