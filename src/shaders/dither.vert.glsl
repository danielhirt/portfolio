#version 300 es

void main() {
  // Generate fullscreen triangle from vertex ID (3 vertices, no buffers needed)
  // Vertex 0: (-1, -1), Vertex 1: (3, -1), Vertex 2: (-1, 3)
  float x = float((gl_VertexID & 1) << 2) - 1.0;
  float y = float((gl_VertexID & 2) << 1) - 1.0;
  gl_Position = vec4(x, y, 0.0, 1.0);
}
