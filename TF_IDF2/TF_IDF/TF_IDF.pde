String[] txt = new String[100];

void preload() { //<>//
  txt = loadStrings("controle de usuario.txt");
} //<>//


void setup() {
  size(600, 600);
  System.out.println(txt);
}
//Type String[] of the last argument to method print(Object...) doesn't exactly match the vararg parameter type. Cast to Object[] to confirm the non-varargs invocation, or pass individual arguments of type Object for a varargs invocation.
