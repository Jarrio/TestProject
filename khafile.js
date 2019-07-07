let project = new Project('Base ECX Project');
project.addAssets('Assets/**');
project.addShaders('Shaders/**');
project.addSources('Sources');
project.addLibrary('ecx');
// project.addDefine('ecx_debug')

resolve(project);
