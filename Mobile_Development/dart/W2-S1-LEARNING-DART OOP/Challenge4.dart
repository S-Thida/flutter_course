

class Distance{
  final double _distance;
  Distance(this._distance);
// named constructor
  Distance.kms(double _kms):_distance=_kms;
  Distance.ms(double _ms):_distance=_ms/1000;
  Distance.cms(double _cms):_distance=_cms/10000;
//getter 
double get kms=> _distance;
double get ms=> _distance*1000;
double get cms=> _distance*10000;


  Distance operator +(covariant  Distance d) {
    return Distance.kms(this._distance + d._distance);
  }
}
void main() {
  Distance d1 = new Distance.kms(3.4);
  Distance d2 = new Distance.ms(1000);
    var totalDistance= d1+d2;
    print("Total Distance: ${totalDistance._distance} kms");
    print("Distance 1: ${d1.kms}kms");
    print("Distance 2: ${d2.kms}kms");
 
}
 

