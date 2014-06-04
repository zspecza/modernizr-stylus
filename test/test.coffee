should           = require 'should'
path             = require 'path'
fs               = require 'fs'
accord           = require 'accord'
cssparse         = require 'css-parse'
modernizr_stylus = require '../'

test_path = path.join(__dirname, 'fixtures')

compile = (p) ->
  accord.load('stylus').renderFile(p, { use: modernizr_stylus() })

match_expected = (out, p, done) ->
  try
    expected_path = path.join(path.dirname(p), path.basename(p, '.styl')) + '.css'
    if not fs.existsSync(expected_path) then throw '"expected" file doesnt exist'
    expected_contents = fs.readFileSync(expected_path, 'utf8')
    cssparse(out).should.eql(cssparse(expected_contents))
  catch err
    return done(err)
  done()

compile_and_match = (p, done) ->
  compile(p)
    .done(((out) => match_expected(out, p, done)), done)

# tests

describe 'api', ->

  before ->
    @pkg = require('../package.json')

  it 'exposes the library path', ->
    modernizr_stylus.path.should.match(/modernizr-stylus/)
  it 'exposes the correct version', ->
    modernizr_stylus.version.should.eql(@pkg.version)
  it 'exposes the library name', ->
    modernizr_stylus.libname.should.eql(@pkg.name)

describe 'yep-nope', ->

  before -> @path = path.join(test_path, 'yep-nope')

  it 'yep/nope main mixins compile', (done) ->
    compile_and_match(path.join(@path, 'yep-nope.styl'), done)

describe 'multiple test classes', ->

  before -> @path = path.join(test_path, 'multiple-test-classes')

  it 'it supports multiple test classes', (done) ->
    compile_and_match(path.join(@path, 'mtc.styl'), done)

  it 'even if they are a comma separated list', (done) ->
    compile_and_match(path.join(@path, 'csl.styl'), done)

describe 'child elements', ->

  before -> @path = path.join(test_path, 'child-elements')

  it 'child elements should be included', (done) ->
    compile_and_match(path.join(@path, 'child-elements.styl'), done)

describe 'multiple target selectors', ->

  before -> @path = path.join(test_path, 'multiple-target-selectors')

  it 'supports multiple target selectors', (done) ->
    compile_and_match(path.join(@path, 'mts.styl'), done)
