var Engine = Matter.Engine,
  Composites = Matter.Composites,
  MouseConstraint = Matter.MouseConstraint,
  Mouse = Matter.Mouse,
  Composite = Matter.Composite,
  Bodies = Matter.Bodies;

// create engine
var engine = Engine.create(),
  world = engine.world;

// create renderer
// var render = Render.create({
//   element: document.querySelector('.matter'),
//   engine: engine,
//   options: {
//     showAngleIndicator: true,
//   },
// });

//위를 각주처리 했기 때문에 이것도 각주처리
// Render.run(render);

// create runner
// var runner = Runner.create();
// Runner.run(runner, engine);
//여기도 마찬가지

// add bodies
var stack = Composites.stack(
  200,
  606 - 25.25 - 5 * 40,
  10,
  5,
  0,
  0,
  function (x, y) {
    return Bodies.rectangle(x, y, 40, 40);
  }
);

Composite.add(world, [stack]);

let walls = [
  Bodies.rectangle(400, 0, 800, 50, { isStatic: true }),
  Bodies.rectangle(800, 300, 50, 600, { isStatic: true }),
  Bodies.rectangle(0, 300, 50, 600, { isStatic: true }),
  Bodies.rectangle(400, 606, 800, 50.5, { isStatic: true }),
];

Composite.add(world, [walls]);

// add mouse control
// var mouse = Mouse.create(render.canvas),
//   mouseConstraint = MouseConstraint.create(engine, {
//     mouse: mouse,
//     constraint: {
//       stiffness: 0.2,
//       render: {
//         visible: false,
//       },
//     },
//   });

// Composite.add(world, mouseConstraint);

function setup() {
  createCanvas(800, 600);
  console.log(walls);
  background(255);
  console.log(stack);
}

function draw() {
  background(255);

  stack.bodies.forEach((aBody) => {
    beginShape();
    aBody.vertices.forEach((aVertex) => {
      vertex(aVertex.x, aVertex.y);
    });
    endShape(CLOSE);
  });

  walls.forEach((eachWall) => {});
  beginShape();
  eachWall.vertices.forEach((eachVertex) => {
    vertex(eachVertex.x, eachVertex.y);
  });
  endShape();
}
