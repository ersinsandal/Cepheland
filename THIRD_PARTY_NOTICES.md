# Third-party data and services

## OpenStreetMap

Geographic datasets and derived map partitions in `apps/api/data`, `infrastructure/maps`, and the prebuilt geographic data in `packages/geo` contain information from OpenStreetMap.

**© OpenStreetMap contributors.** OpenStreetMap data is available under the [Open Database License (ODbL) 1.0](https://opendatacommons.org/licenses/odbl/1-0/). See [OpenStreetMap copyright and attribution](https://www.openstreetmap.org/copyright) for the source attribution and data terms. ODbL obligations apply to redistribution of the covered databases and derived databases; the game's source code is a separate work.

The prepared opening-area bundle is documented in [apps/api/data/README.md](apps/api/data/README.md). It includes public road, water and place features, computed parcel geometry and naming candidates. It contains no player account or ownership records. Data coverage and collection dates are recorded with the bundle. Historical place names are not evidence that a business is currently operating.

Street tiles displayed by the application are requested from OpenStreetMap's tile service and are not included in the repository. Using the data license does not provide unrestricted access to the public tile or query services. Review the [tile usage policy](https://operations.osmfoundation.org/policies/tiles/) and the policies of the selected query provider before deployment.

## Place search and imagery

The default place-search provider is the public [Photon](https://github.com/komoot/photon) service. The API endpoint can be replaced with a compatible service. Public-service availability and capacity are not guaranteed by this repository.

The optional satellite layer uses Esri World Imagery. Imagery is requested at runtime; it is not bundled or relicensed by this project. Esri attribution remains visible in the map. Review the provider's applicable terms for the intended deployment.

## Dependencies and marks

JavaScript dependencies retain their respective licenses. Exact versions and resolved packages are recorded in `pnpm-lock.yaml`; their license texts are supplied by the package authors.

Club names, platform names and other third-party marks used in demonstration leagues remain associated with their respective owners. Their presence identifies the demonstration teams and does not imply endorsement, sponsorship or permission for commercial use.

No general source-code license has been selected for Cepheland. Publishing the repository does not replace the terms applicable to third-party data, dependencies or marks.
