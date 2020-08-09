import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

class VectorPathPainter extends CustomPainter {
  VectorPathPainter({@required List<SVGPath> paths}) : 
  _paths = paths.map((e) =>  parseSvgPathData(e.path)).toList(),
  _paints = paths.map((e) =>  e.getPaint()).toList();

  final List<Path> _paths;
  final List<Paint> _paints;
  @override
  bool shouldRepaint(VectorPathPainter oldDelegate) => true;

  @override
  void paint(Canvas canvas, Size size) {

    List<Path> _sizedPaths = getClips(size);
    print("Clips");
    //for (int i=0; i<_sizedPaths.length;i++){
  // _sizedPaths.forEach((element) {
  //   element.moveTo(size.width/2, size.height/2);
  //   canvas.drawPath(
  //           ele, 
  //           _paints[0]
  //         );
  // });
    _sizedPaths[0].moveTo(size.width/2, size.height/2);
    canvas.drawPath(
            _sizedPaths[0], 
            _paints[0]
          );
    _sizedPaths[1].moveTo(size.width/2, size.height/2);
    canvas.drawPath(
            _sizedPaths[1], 
            _paints[1]
          );
         
   // }
    
  }

  List<Path> getClips(Size size) {
    //parseSvgPathData comes from a package
    //Library link: https://pub.dev/packages/path_drawing (Library link)
    //parseSvgPathData returns a Path object
    //extracting path from SVG data
    print(size);
    return _paths.map((p) {
    final Rect pathBounds = p.getBounds();
    final Matrix4 matrix4 = Matrix4.identity();
    matrix4.scale(size.width / pathBounds.width, size.height / pathBounds.height);
    return p.transform(matrix4.storage);// path is returned to ClipPath clipper
 }).toList();
  }
}

  /*<svg width="32" height="24" viewBox="0 0 32 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M1 12C15.8399 12 16.1601 12 31 12M1 12L4 9M1 12L4 15" stroke="black" stroke-linecap="round" stroke-linejoin="round"/>
</svg>*/
VectorImg toVectorImage({@required String svgData}){
  //List<String> pathStrings=[];
  var p = svgData.substring(svgData.indexOf("<path"),svgData.indexOf("</svg>") );
  List<SVGPath> d= p.split("/>").where((element) => element.contains("<path")).map((e) => toSVGPath(e.substring("<path".length))).toList();
  return VectorImg(
    paths: d
 );

}

SVGPath toSVGPath(String pathData){
  int start =pathData.indexOf("d=")+3;
  int end = pathData.indexOf("\"", start+1);
  String pathStr = pathData.substring(start, end);
  print(pathStr);
  return SVGPath(
    path:pathStr
  );

}

class VectorImg{
  final double initialWidth;
  final double initialHeight;
  final List<SVGPath> paths;

  VectorImg({
    this.initialHeight,
    this.initialWidth,
    this.paths
  });


  Widget toWidget({@required double h, @required double w}){
    return Container(
      height:h,
      width:w,
      child: CustomPaint(
        size:Size(h,w),
      painter: VectorPathPainter(
        paths:paths
      )
      )
    );
  }


}



class SVGPath{
  final String path;
  final StrokeCap strokeCap;
  final StrokeJoin strokeJoin;
  final Color strokeColor;
  final Color fillColor;

  SVGPath({
    @required this.path, 
    this.strokeCap, 
    this.strokeJoin, 
    this.strokeColor, 
    this.fillColor
  });

  Paint getPaint() {
    bool fill = fillColor!=null;
    if(fill)
      return Paint()
            ..color=fillColor??Colors.black
            ..style=PaintingStyle.fill;
    return Paint()
            ..color=strokeColor??Colors.black
            ..strokeJoin=strokeJoin??StrokeJoin.round
            ..style=PaintingStyle.stroke
            ..strokeCap=strokeCap??StrokeCap.square;
}}



/*

back
<svg width="32" height="24" viewBox="0 0 32 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M1 12C15.8399 12 16.1601 12 31 12M1 12L4 9M1 12L4 15" stroke="black" stroke-linecap="round" stroke-linejoin="round"/>
</svg>

back 15
<svg width="24" height="30" viewBox="0 0 24 30" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M1 0C1.553 0 2 0.448 2 1V5.378C3.772 3.75 5.982 2.599 8.343 2.117C15.552 0.648 21.73 5.578 22.828 12.155C23.572 16.607 21.873 20.921 18.653 23.692C18.231 24.055 17.601 24.004 17.243 23.588C16.882 23.17 16.929 22.538 17.348 22.178C20.003 19.89 21.492 16.291 20.856 12.485C19.943 7.02 14.832 2.839 8.743 4.078C6.663 4.501 4.721 5.536 3.19 7H8C8.553 7 9 7.448 9 8C9 8.553 8.553 9 8 9H1C0.448004 9 3.8147e-06 8.553 3.8147e-06 8V1C3.8147e-06 0.448 0.448004 0 1 0Z" fill="black"/>
<path d="M3.12695 21.1172V20.1699C3.56641 20.1504 3.87402 20.1211 4.0498 20.082C4.32975 20.0202 4.55762 19.8965 4.7334 19.7109C4.85384 19.584 4.94499 19.4147 5.00684 19.2031C5.04264 19.0762 5.06055 18.9818 5.06055 18.9199H6.21777V26H4.79199V21.1172H3.12695ZM9.65039 24.1055C9.70573 24.4082 9.81152 24.6426 9.96777 24.8086C10.124 24.9714 10.3519 25.0527 10.6514 25.0527C10.9964 25.0527 11.2585 24.9323 11.4375 24.6914C11.6198 24.4473 11.7109 24.1413 11.7109 23.7734C11.7109 23.4121 11.6263 23.1077 11.457 22.8604C11.2878 22.6097 11.0241 22.4844 10.666 22.4844C10.4967 22.4844 10.3503 22.5055 10.2266 22.5479C10.0085 22.626 9.84408 22.7708 9.7334 22.9824L8.4834 22.9238L8.98145 19.0127H12.8828V20.1943H9.9873L9.7334 21.7422C9.94824 21.6022 10.1159 21.5094 10.2363 21.4639C10.4382 21.389 10.6839 21.3516 10.9736 21.3516C11.5596 21.3516 12.0706 21.5485 12.5068 21.9424C12.943 22.3363 13.1611 22.9092 13.1611 23.6611C13.1611 24.3154 12.9512 24.8997 12.5312 25.4141C12.1113 25.9284 11.4831 26.1855 10.6465 26.1855C9.97266 26.1855 9.41927 26.0049 8.98633 25.6436C8.55339 25.2822 8.3125 24.7695 8.26367 24.1055H9.65039Z" fill="black"/>
</svg>

bookmark-active
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M6 4V20L12.5 13.8462L19 20V4H6Z" fill="black"/>
<path d="M6 20H5.25C5.25 20.2996 5.42832 20.5705 5.70354 20.6889C5.97876 20.8074 6.29805 20.7506 6.51563 20.5446L6 20ZM6 4V3.25C5.58579 3.25 5.25 3.58579 5.25 4H6ZM19 4H19.75C19.75 3.58579 19.4142 3.25 19 3.25V4ZM19 20L18.4844 20.5446C18.7019 20.7506 19.0212 20.8074 19.2965 20.6889C19.5717 20.5705 19.75 20.2996 19.75 20H19ZM12.5 13.8462L13.0156 13.3015C12.7264 13.0277 12.2736 13.0277 11.9844 13.3015L12.5 13.8462ZM6.75 20V4H5.25V20H6.75ZM6 4.75H19V3.25H6V4.75ZM18.25 4V20H19.75V4H18.25ZM19.5156 19.4554L13.0156 13.3015L11.9844 14.3908L18.4844 20.5446L19.5156 19.4554ZM11.9844 13.3015L5.48437 19.4554L6.51563 20.5446L13.0156 14.3908L11.9844 13.3015Z" fill="black"/>
</svg>

bookmark-inactive
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M6 20H5.25C5.25 20.2996 5.42832 20.5705 5.70354 20.6889C5.97876 20.8074 6.29805 20.7506 6.51563 20.5446L6 20ZM6 4V3.25C5.58579 3.25 5.25 3.58579 5.25 4H6ZM19 4H19.75C19.75 3.58579 19.4142 3.25 19 3.25V4ZM19 20L18.4844 20.5446C18.7019 20.7506 19.0212 20.8074 19.2965 20.6889C19.5717 20.5705 19.75 20.2996 19.75 20H19ZM12.5 13.8462L13.0156 13.3015C12.7264 13.0277 12.2736 13.0277 11.9844 13.3015L12.5 13.8462ZM6.75 20V4H5.25V20H6.75ZM6 4.75H19V3.25H6V4.75ZM18.25 4V20H19.75V4H18.25ZM19.5156 19.4554L13.0156 13.3015L11.9844 14.3908L18.4844 20.5446L19.5156 19.4554ZM11.9844 13.3015L5.48437 19.4554L6.51563 20.5446L13.0156 14.3908L11.9844 13.3015Z" fill="black"/>
</svg>

forward 15
<svg width="24" height="30" viewBox="0 0 24 30" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M23 0C22.447 0 22 0.448 22 1V5.378C20.228 3.75 18.018 2.599 15.657 2.117C8.448 0.648 2.27 5.578 1.172 12.155C0.427997 16.607 2.127 20.921 5.347 23.692C5.769 24.055 6.399 24.004 6.757 23.588C7.118 23.17 7.071 22.538 6.652 22.178C3.997 19.89 2.508 16.291 3.144 12.485C4.057 7.02 9.168 2.839 15.257 4.078C17.337 4.501 19.279 5.536 20.81 7H16C15.447 7 15 7.448 15 8C15 8.553 15.447 9 16 9H23C23.552 9 24 8.553 24 8V1C24 0.448 23.552 0 23 0Z" fill="black"/>
<path d="M10.127 21.1172V20.1699C10.5664 20.1504 10.874 20.1211 11.0498 20.082C11.3298 20.0202 11.5576 19.8965 11.7334 19.7109C11.8538 19.584 11.945 19.4147 12.0068 19.2031C12.0426 19.0762 12.0605 18.9818 12.0605 18.9199H13.2178V26H11.792V21.1172H10.127ZM16.6504 24.1055C16.7057 24.4082 16.8115 24.6426 16.9678 24.8086C17.124 24.9714 17.3519 25.0527 17.6514 25.0527C17.9964 25.0527 18.2585 24.9323 18.4375 24.6914C18.6198 24.4473 18.7109 24.1413 18.7109 23.7734C18.7109 23.4121 18.6263 23.1077 18.457 22.8604C18.2878 22.6097 18.0241 22.4844 17.666 22.4844C17.4967 22.4844 17.3503 22.5055 17.2266 22.5479C17.0085 22.626 16.8441 22.7708 16.7334 22.9824L15.4834 22.9238L15.9814 19.0127H19.8828V20.1943H16.9873L16.7334 21.7422C16.9482 21.6022 17.1159 21.5094 17.2363 21.4639C17.4382 21.389 17.6839 21.3516 17.9736 21.3516C18.5596 21.3516 19.0706 21.5485 19.5068 21.9424C19.943 22.3363 20.1611 22.9092 20.1611 23.6611C20.1611 24.3154 19.9512 24.8997 19.5312 25.4141C19.1113 25.9284 18.4831 26.1855 17.6465 26.1855C16.9727 26.1855 16.4193 26.0049 15.9863 25.6436C15.5534 25.2822 15.3125 24.7695 15.2637 24.1055H16.6504Z" fill="black"/>
</svg>

library active
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<rect width="24" height="24" fill="white" fill-opacity="0.01"/>
<mask id="mask0" mask-type="alpha" maskUnits="userSpaceOnUse" x="0" y="0" width="24" height="24">
<rect width="24" height="24" fill="white"/>
</mask>
<g mask="url(#mask0)">
<path d="M20.5529 2H5.34822C4.29909 2 3.44763 2.86667 3.44763 3.93452M3.44763 3.93452C3.44763 5.00335 4.29909 5.86905 5.34822 5.86905H20.5529V22.247H5.34822C4.29909 22.247 3.44763 21.3813 3.44763 20.3125V3.93452Z" stroke="black" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M3.5 6H21V22H4L3.5 14L3.5 6Z" fill="black"/>
<path d="M5.34827 3.93408H19.6027" stroke="black" stroke-linecap="round" stroke-linejoin="round"/>
</g>
</svg>

library inactive
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<rect width="24" height="24" fill="white" fill-opacity="0.01"/>
<mask id="mask0" mask-type="alpha" maskUnits="userSpaceOnUse" x="0" y="0" width="24" height="24">
<rect width="24" height="24" fill="white"/>
</mask>
<g mask="url(#mask0)">
<path d="M20.5529 2H5.34822C4.29909 2 3.44763 2.86667 3.44763 3.93452M3.44763 3.93452C3.44763 5.00335 4.29909 5.86905 5.34822 5.86905H20.5529V22.247H5.34822C4.29909 22.247 3.44763 21.3813 3.44763 20.3125V3.93452Z" stroke="black" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M5.34827 3.93408H19.6027" stroke="black" stroke-linecap="round" stroke-linejoin="round"/>
</g>
</svg>




*/


// class VectorClipper extends CustomClipper<Path> {
//   VectorClipper(String path) : 
//   p = parseSvgPathData(path);

//   final Path p;
//   @override
//   Path getClip(Size size) {
//      //parseSvgPathData comes from a package
//     //Library link: https://pub.dev/packages/path_drawing (Library link)
//     //parseSvgPathData returns a Path object
//     //extracting path from SVG data
//     final Rect pathBounds = p.getBounds();
//     final Matrix4 matrix4 = Matrix4.identity();
//     matrix4.scale(size.width / pathBounds.width, size.height / pathBounds.height);
//     return p.transform(matrix4.storage);// path is returned to ClipPath clipper
//   }

//   @override
//   bool shouldReclip(VectorClipper oldClipper) => false;
// }

// class VectorPathPainter extends CustomPainter {
//   VectorPathPainter(String path, Color color, PaintingStyle paintingStyle) : 
//   p = parseSvgPathData(path),
//   ps=paintingStyle,
//   c=color;

//   final Path p;
//   final Color c;
//   final PaintingStyle ps;
//   @override
//   bool shouldRepaint(VectorPathPainter oldDelegate) => true;

//   @override
//   void paint(Canvas canvas, Size size) {

//     Path newP = getClip(size);
//     final Paint paint = Paint()
//         ..color=c
//         ..strokeWidth = 1.0
//         ..style = ps;
//     newP.moveTo(size.width/2, size.height/2);
//     canvas.drawPath(
//       newP, 
//       paint
//     );
//   }

//   Path getClip(Size size) {
//     //parseSvgPathData comes from a package
//     //Library link: https://pub.dev/packages/path_drawing (Library link)
//     //parseSvgPathData returns a Path object
//     //extracting path from SVG data
//     final Rect pathBounds = p.getBounds();
//     final Matrix4 matrix4 = Matrix4.identity();
//     matrix4.scale(size.width / pathBounds.width, size.height / pathBounds.height);
//     return p.transform(matrix4.storage);// path is returned to ClipPath clipper
//   }
// }