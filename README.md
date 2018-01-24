# pegasus-split-example

This is a sample Pegasus workflow showing how you can split a given
input into a set of chunks, process each chunk and the merge results
together.

For the sake of simplicity of the demonstration, the workflow is
using simple system tools like `split`, `wc` and `cat`. For a
production workflow, these would probably be replaced with domain
specific tools.

To test the workflow out, run:

```
./submit $PWD/test/Ulysses_by_James_Joyce.txt
```

This will split the book up into chunks, count the characters
in each chunk, and then merge the results back into a 
`merged.results` file.

Outputs will staged to `runs/[RUNID]/outputs/`


## Why a Hierarchical Workflow?

Pegasus is a planning workflow system, which means that all the
tasks and file objects need to be explicitly defined, so that
task and data placements and movements can be planned out in 
detail. For workflows with "dynamic" steps, such as having a
split job for which you do not the number of outputs
beforehand, we need to defer part of the workflow planning
until that task has been completed and we can see the number
of split chunks. One approach is to use hierarchical workflows:

 * The top level workflow runs the split
 * The top level workflow then runs a second level dax
   generator, which sees the split outputs and creates
   a sub-workflow to process the outputs
 * The top level workflow plans and executes
   the sub-workflow


