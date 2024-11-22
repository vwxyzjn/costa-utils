import beaker
from rich.pretty import pprint
from beaker import Beaker
import os
import tempfile

beaker_client = beaker.Beaker.from_env()
whoami = beaker_client.account.whoami().name

def get_dataset(experiment_id: str):
    ex = beaker_client.experiment.get(experiment_id)
    dataset_id = ex.jobs[0].result.beaker
    dataset_dir = f"tmpdir/{dataset_id}"
    if not os.path.exists(dataset_dir):
        os.makedirs(dataset_dir)
        beaker_client.dataset.fetch(dataset_id, dataset_dir)
    return dataset_dir

dataset_dir1 = get_dataset("01JC3JT8TQW6GZ1CXA7N624GJN")
dataset_dir2 = get_dataset("01JBJ5V6BBT8Q1741T79CGRN50")

# beaker_secrets = [secret.name for secret in beaker_client.workspace.secrets()]
# experiment_spec = beaker.ExperimentSpec(
#     description=args.description,
#     tasks=[make_task_spec(args, command, i, beaker_secrets, whoami, args.resumable) for i, command in enumerate(commands)],
#     budget=args.budget,
# )

# exp = beaker_client.experiment.create(spec=experiment_spec)
# print(f"Kicked off Beaker job. https://beaker.org/ex/{exp.id}")
